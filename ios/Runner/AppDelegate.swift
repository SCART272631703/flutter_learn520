//
//  AppDelegate.swift
//  my_swift
//
//  Created by 杨虎 on 2024/5/29.
//
import UIKit
import Flutter


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
 override func application( _ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?
 ) -> Bool {
     // 1.获取FlutterViewController(是应⽤程序的默认Controller)
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
     // 2.获取MethodChannel(⽅法通道)
    let batteryChannel = FlutterMethodChannel(name: "coderwhy.com/battery", binaryMessenger: controller.binaryMessenger)
    // 3.监听⽅法调⽤(会调⽤传⼊的回调函数)
    batteryChannel.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
    // 3.1.判断是否是getBatteryInfo的调⽤,告知Flutter端没有实现对应的⽅法
        guard call.method == "getBatteryInfo" else {
            result(FlutterMethodNotImplemented)
            return
        }
    // 3.2.如果调⽤的是getBatteryInfo的⽅法, 那么通过封装的另外⼀个⽅法实现回调
        self?.receiveBatteryLevel(result: result)
    })
 
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
 }
 
private func receiveBatteryLevel(result: FlutterResult) {
    // 1.iOS中获取信息的⽅式
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
 
    // 2.如果没有获取到,那么返回给Flutter端⼀个异常
    if device.batteryState == UIDevice.BatteryState.unknown {
        // result(FlutterError(code: "UNAVAILABLE",
        // message: "Battery info unavailable",
        // details: "No Battery info!"))
        result(String(0.54 * 100))
    } else {
    // 3.通过result将结果回调给Flutter端
        result(String(device.batteryLevel * 100))
    }
 }
}


//     // 1.创建⼀个FlutterEngine对象
//     lazy var flutterEngine = FlutterEngine(name: "myflutter engine")

//     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//         window = UIWindow(frame: UIScreen.main.bounds)
//         window?.makeKeyAndVisible()
//         // 2.启动flutterEngine Plugin插件 Registrant登记者 
//         flutterEngine.run()
//         GeneratedPluginRegistrant.register(with: self.flutterEngine)
//         getBatarryInfo()
//         return true
//     }

//    func getBatarryInfo() {
//         // 1.获取FlutterViewController(是应⽤程序的默认Controller) binary 二进制的 双重的
//         let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
//         let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
//          // 2.获取MethodChannel(⽅法通道)
//         let batteryChannel = FlutterMethodChannel(name:"coderwhy.com/battery", binaryMessenger: flutterViewController.binaryMessenger)

//          // 3.监听⽅法调⽤(会调⽤传⼊的回调函数)
//          batteryChannel.setMethodCallHandler({
//              [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
//              // 3.1.判断是否是getBatteryInfo的调⽤,告知Flutter端没有实现对应的⽅法
//              guard call.method == "getBatteryInfo" else {
//                  result(FlutterMethodNotImplemented)
//                  return
//              }
//              // 3.2.如果调⽤的是getBatteryInfo的⽅法, 那么通过封装的另外 ⼀个⽅法实现回调
//              self?.receiveBatteryLevel(result: result)
//          })
//     }

//     func receiveBatteryLevel(result: FlutterResult) {
//         // 1.iOS中获取信息的⽅式
//         let device = UIDevice.current
//         device.isBatteryMonitoringEnabled = true

//         // 2.如果没有获取到,那么返回给Flutter端⼀个异常
//         if device.batteryState == UIDevice.BatteryState.unknown{
//             result(FlutterError(code: "UNAVAILABLE",
//             message: "Battery info unavailable",
//             details: "No Battery info"))
//         } else {
//     // 3.通过result将结果回调给Flutter端
//             result(String(device.batteryLevel * 100))
//         }
//     }
// }

