@objc(CloudPreventCapture)
class CloudPreventCapture: RCTEventEmitter {

    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }

    override func supportedEvents() -> [String]! {
      return ["ON_SCREENSHOT", "ON_SCREEN_CAPTURE"]
    }

    override func constantsToExport() {
      return [
        "ON_SCREENSHOT": "ON_SCREENSHOT",
        "ON_SCREEN_CAPTURE": "ON_SCREEN_CAPTURE",
      ];
    }

    override static func requiresMainQueueSetup() {
      return true;
    }
}
