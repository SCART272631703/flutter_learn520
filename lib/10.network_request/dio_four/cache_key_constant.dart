//缓存key

// 需要退出登录时候清空的缓存 用这个 前缀key
const String kNeedLoginOutCleanPrefix = 'kDemo_';

// 设备初始化key
const String kInitDeviceCacheKey = 'kInitDeviceCacheKey';

prefixCacheKey(String key) {
  return '$kNeedLoginOutCleanPrefix$key';
}

class CacheKey {
  //音频文件名字前缀
  static const String kVideoNamePrefix = 'videoNamePrefix';

  // 测试环境下 改环境缓存key
  static const String kTestAppEnvironmentKey = 'kTestAppEnvironmentKey';

  // 隐私弹窗是否弹出来过
  static const String kShowedAgreementCacheKey = 'kShowedAgreementCacheKey';
}

class TDLoginConstant {
  // 登录结果
  static String loginResultKey() {
    return "${kNeedLoginOutCleanPrefix}kLoginResultModelKey";
  }
}
