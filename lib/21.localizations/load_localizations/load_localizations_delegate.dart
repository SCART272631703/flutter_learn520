import 'package:flutter/cupertino.dart';
import 'load_localizations.dart';

class HYLoadLocalizationsDelegate
    extends LocalizationsDelegate<HYLoadLocalizations> {
  const HYLoadLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    // isSupported：⽤于当前环境的Locale，是否在我们⽀持的语⾔范围
    debugPrint('------------- ${locale.languageCode} ---------------');
    return ["en", "zh"].contains(locale.languageCode);
  }

  
  @override
  bool shouldReload(LocalizationsDelegate<HYLoadLocalizations> old) {
    // shouldReload：当Localizations Widget重新build时，是否调⽤load⽅法重新加载Locale资源
    // ⼀般情况下，Locale资源只应该在Locale切换时加载⼀次，不需要每次Localizations重新build时都加载⼀遍；
    // 所以⼀般情况下返回false即可；
    return false;
  }

  // 在HYLocalizationsDelegate中使⽤异步进⾏加载：
  @override
  Future<HYLoadLocalizations> load(Locale locale) async {
    // load⽅法：当Locale发⽣改变时（语⾔环境），加载对应的HYLocalizations资源
    // 这个⽅法返回的是⼀个Future，因为有可能是异步加载的；
    // 但是我们这⾥是直接定义的⼀个Map，因此可以直接返回⼀个同步的Future（SynchronousFuture）
    // return SynchronousFuture(HYLoadLocalizations(locale));
    final localization = HYLoadLocalizations(locale);
    await localization.loadJson();
    return localization;
  }

  static HYLoadLocalizationsDelegate delegate = const HYLoadLocalizationsDelegate();
}
