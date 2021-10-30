#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(CloudPreventCapture, RCTEventEmitter)

RCT_EXTERN_METHOD(startPreventingRecording: (RCTPromiseResolveBlock)resolve
                                            rejecter: (RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(stopPreventingRecording: (RCTPromiseResolveBlock)resolve
                                           rejecter: (RCTPromiseRejectBlock)reject)

@end
