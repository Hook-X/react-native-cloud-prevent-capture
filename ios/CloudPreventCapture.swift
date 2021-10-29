@objc(CloudPreventCapture)
class CloudPreventCapture: RCTEventEmitter {

    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }

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
        NotificationCenter.default.addObserver(self, selector: #selector(didDetectRecording), name: UIScreen.capturedDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didDetectScreenshot), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
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
        NotificationCenter.default.removeObserver(self, name: UIScreen.capturedDidChangeNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.userDidTakeScreenshotNotification, object: nil)
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
}
