// 2.2.2. ⾃定义Delegate
// 上⾯的类定义好后，我们在什么位置或者说如何对它进⾏初始化呢？
// • 答案是我们可以像Flutter Widget中的国际化⽅式⼀样对它们进⾏初始化；
// • 也就是我们也定义⼀个对象的Delegate类，并且将其传⼊localizationsDelegates中；
// • Delegate的作⽤就是当Locale发⽣改变时，调⽤对应的load⽅法，重新加载新的Locale资源；

// HYLocalizationsDelegate需要继承⾃LocalizationsDelegate，并且有三个⽅法必须重写：
// • isSupported：⽤于当前环境的Locale，是否在我们⽀持的语⾔范围
// • shouldReload：当Localizations Widget重新build时，是否调⽤load⽅法重新加载Locale资源
// • ⼀般情况下，Locale资源只应该在Locale切换时加载⼀次，不需要每次Localizations重新build时都加载⼀遍；
// • 所以⼀般情况下返回false即可；
// • load⽅法：当Locale发⽣改变时（语⾔环境），加载对应的HYLocalizations资源
// • 这个⽅法返回的是⼀个Future，因为有可能是异步加载的；
// • 但是我们这⾥是直接定义的⼀个Map，因此可以直接返回⼀个同步的Future（SynchronousFuture）

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'localizations.dart';

class HYLocalizationsDelegate extends LocalizationsDelegate<HYLocalizations> {
  const HYLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    // isSupported：⽤于当前环境的Locale，是否在我们⽀持的语⾔范围
    debugPrint('------------- ${locale.languageCode} ---------------');
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<HYLocalizations> old) {
    // shouldReload：当Localizations Widget重新build时，是否调⽤load⽅法重新加载Locale资源
    // ⼀般情况下，Locale资源只应该在Locale切换时加载⼀次，不需要每次Localizations重新build时都加载⼀遍；
    // 所以⼀般情况下返回false即可；
    return false;
  }

  @override
  Future<HYLocalizations> load(Locale locale) {
    // load⽅法：当Locale发⽣改变时（语⾔环境），加载对应的HYLocalizations资源
    // 这个⽅法返回的是⼀个Future，因为有可能是异步加载的；
    // 但是我们这⾥是直接定义的⼀个Map，因此可以直接返回⼀个同步的Future（SynchronousFuture）
    return SynchronousFuture(HYLocalizations(locale));
  }



  static HYLocalizationsDelegate delegate = const HYLocalizationsDelegate();
}
