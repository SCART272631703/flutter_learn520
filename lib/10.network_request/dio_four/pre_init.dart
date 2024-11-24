import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'flutter_extension.dart';
import 'jd_cache.dart';
import 'jd_colors.dart';
import 'router_util.dart';
import 'loading_util.dart';
import 'app_init_config.dart';

final RouteObserver<PageRoute> kRouteObserver = RouteObserver<PageRoute>();

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

typedef InitCompleteCallback = Function(Map packageInfo);

typedef CreateThemeData = ThemeData Function(PreInit application);

class PreInit extends StatefulWidget {
  static BuildContext get currentContext => _navigatorKey.currentContext!;
  final WidgetBuilder homePage;
  final InitCompleteCallback? initCompleteCallback;

  const PreInit({
    super.key,
    this.initCompleteCallback,
    required this.homePage,
  });
  @override
  State<PreInit> createState() => _PreInitState();
}

class _PreInitState extends State<PreInit> {
  late  Future<Map>  _futureBuilderFuture;

  @override
  void initState() {
    _futureBuilderFuture = _gerData();
    super.initState();
  }

  Future<Map> _gerData() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    AppInitConfig.setStatusBarLight(false);

    //严格限制这里的 await 数量  影响启动
    await JDCache.getInstance();
    Map appInfo = {};
    // if (JDDevice.isIOS) {
    //   appInfo = await JDPluginInstance().getIosAppInfo();
    // } else {
    //   appInfo = await JDPluginInstance().getAndroidAppInfo();
    // }
    // final packageInfo = await PackageInfo.fromPlatform();
    widget.initCompleteCallback?.call(appInfo);
    return appInfo;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _futureBuilderFuture,
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.data == null) {
          // 初始化前显示的 最好显示个启动图
          return Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          );
        }
        ScreenUtil.init(context, designSize: const Size(375, 812));
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate, //iOS
          ],
          supportedLocales: const [
            Locale('zh', 'CN'),
            Locale('en', 'US'),
          ],
          locale: const Locale('zh'),
          title: 'demo app',
          navigatorKey: _navigatorKey,
          navigatorObservers: [kRouteObserver],
          theme: ThemeData(
            brightness: Brightness.light,
            // 应用程序主要部分的背景颜色（Toolbars、TabBar等）
            primaryColor: JDColors.appMain,
            primaryTextTheme: Typography.material2018().white,
            textTheme: const TextTheme(
              // TextField输入文字颜色
              titleMedium: TextStyle(color: JDColors.c666666, fontSize: 15),
              // Text文字样式
              bodyMedium: TextStyle(color: JDColors.c666666, fontSize: 18),
              titleSmall: TextStyle(color: JDColors.c666666, fontSize: 13),
            ),
            // 与primaryColor形成对比的文本主题
            // 选中在泼墨动画期间使用的突出显示颜色，或用于指示菜单中的项
            highlightColor: const Color.fromRGBO(0, 0, 0, 0),
            // InkWell使用
            splashColor: const Color.fromRGBO(0, 0, 0, 0),
            canvasColor: Colors.white,
            // 典型Material应用程序或应用程序内页面的背景颜色
            scaffoldBackgroundColor: Colors.white,
            // Card的颜色
            cardColor: Colors.white,
            // Divider和PopupMenuDivider的颜色，也用于ListTile之间、DataTable的行之间等
            dividerColor: Colors.grey,
            //指定平台,应用特定平台控件风格
            platform: TargetPlatform.iOS,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          builder: (BuildContext context, Widget? child) => Material(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < constraints.maxHeight) {
                  density = constraints.maxWidth / 375;
                } else {
                  density = constraints.maxHeight / 375;
                }
                var valueKey = ValueKey(
                  'density == $density ,'
                  'targetWidthDp == ${constraints.maxWidth} ,'
                  'targetHeightDp == ${constraints.maxHeight} ,',
                );
                return JDLoadingTool.builder(context).call(
                  context,
                  KeyedSubtree(key: valueKey, child: child!),
                );
              },
            ),
          ),
          onGenerateRoute: RouterUtil.routeFactory,
          onUnknownRoute: RouterUtil.routeFactory,
          home: widget.homePage.call(context),
        );
      },
    );
  }
}
