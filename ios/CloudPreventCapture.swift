import Foundation
import UIKit
@objc(CloudPreventCapture)
class CloudPreventCapture: RCTEventEmitter {

    override func supportedEvents() -> [String]! {
      return ["ON_SCREENSHOT", "ON_SCREEN_CAPTURE"]
    }

    override func constantsToExport() -> [AnyHashable : Any]! {
      return [
        "ON_SCREENSHOT": "ON_SCREENSHOT",
        "ON_SCREEN_CAPTURE": "ON_SCREEN_CAPTURE",
      ];
    }

    override static func requiresMainQueueSetup() -> Bool {
      return true;
    }

    @objc func startPreventingRecording(_ resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
      do {
          if #available(iOS 11.0, *) {
              NotificationCenter.default.addObserver(self, selector: #selector(didDetectRecording), name: NSNotification.Name.UIScreenCapturedDidChange, object: nil)
          } else {
              // Fallback on earlier versions
          }
          NotificationCenter.default.addObserver(self, selector: #selector(didDetectScreenshot), name: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil)
        resolve(true)
      } catch let error {
        reject("START ERROR", "Could not start prevent recording", error)
      }
    }

    @objc private func didDetectRecording() {
        DispatchQueue.main.async {
          if #available(iOS 11, *) {
            if UIScreen.main.isCaptured {
                    self.sendEvent(withName: "ON_SCREEN_CAPTURE", body: ["isCaptured": true])
                } else {
                    self.sendEvent(withName: "ON_SCREEN_CAPTURE", body: ["isCaptured": false])
                }
          }
        }
    }

    @objc func stopPreventingRecording(_ resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) {
      do {
          if #available(iOS 11.0, *) {
              NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIScreenCapturedDidChange, object: nil)
          } else {
              // Fallback on earlier versions
          }
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil)
        resolve(true)
      } catch let error {
        reject("STOP ERROR", "Could not stop prevent recording", error)
      }
    }

//    @objc func startPreventingScreenshot() {
//        NotificationCenter.default.addObserver(self, selector: #selector(didDetectScreenshot), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
//    }

    @objc private func didDetectScreenshot() {
        DispatchQueue.main.async {
            self.sendEvent(withName: "ON_SCREENSHOT", body: ["isScreenShot": true])
        }
    }
    
    @objc func detectVolumePressed() {
        NotificationCenter.default.addObserver(self, selector: #selector(didDetectScreenshot), name: NSNotification.Name(rawValue: "AVSystemController_SystemVolumeDidChangeNotification"), object: nil)
    }
    
    @objc func stopDetectVolumePressed() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "AVSystemController_SystemVolumeDidChangeNotification"), object: nil)
    }
    
    @objc func detectPowerPressed() {
        NotificationCenter.default.addObserver(self, selector: #selector(didDetectScreenshot), name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
    }
    
    @objc func stopDetectPowerPressed() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIApplicationWillResignActive, object: nil)  
    }
}
