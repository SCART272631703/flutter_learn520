import '../jd_device.dart';

class BaseRequestParam {
  // 请求头
  Map<String, dynamic> getRequestMap() {
    Map<String, dynamic> requestParamMap = {};
    requestParamMap.addAll(baseMap);
    requestParamMap.addAll(getEveryTimeBaseMap());
    return requestParamMap;
  }

  Map<String, dynamic>? _baseMap;
  Map<String, dynamic> get baseMap {
    if (_baseMap != null) {
      return _baseMap ?? {};
    } else {
      _baseMap = updateOnceBaseMap();
      return _baseMap ?? {};
    }
  }

  set baseMap(Map<String, dynamic> value) {
    _baseMap = value;
  }

  // 只在启动时候获取一次的基础参数 有更改时候更新下
  Map<String, dynamic> updateOnceBaseMap() {
    Map<String, dynamic> theBaseMap = {
      'device_type': JDDevice.isIOS ? 'iphone' : 'android',
    };

    if (JDDevice.isIOS) {
      Map<String, dynamic> iosBaseMap = {};
      theBaseMap.addAll(iosBaseMap);
    } else {
      Map<String, dynamic> androidBaseMap = {
        'androidid': '',
      };
      theBaseMap.addAll(androidBaseMap);
    }
    _baseMap = theBaseMap;
    return theBaseMap;
  }

// 每次都获取的基础参数
  Map<String, dynamic> getEveryTimeBaseMap() {
    return {
      'request_time': DateTime.now().millisecondsSinceEpoch,
    };
  }
}
