import { NativeModules, Platform, NativeEventEmitter } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-cloud-prevent-capture' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const CloudPreventCapture = NativeModules.CloudPreventCapture
  ? NativeModules.CloudPreventCapture
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export default CloudPreventCapture;

export function startPreventingRecording(): Promise<boolean> {
  return CloudPreventCapture.startPreventingRecording();
}
export function stopPreventingRecording(): Promise<boolean> {
  return CloudPreventCapture.stopPreventingRecording();
}
export function detectVolumePressed(): void {
  return CloudPreventCapture.detectVolumePressed();
}
export function detectPowerPressed(): void {
  return CloudPreventCapture.detectPowerPressed();
}
export function stopDetectVolumePressed(): void {
  return CloudPreventCapture.stopDetectVolumePressed();
}
export function stopDetectPowerPressed(): void {
  return CloudPreventCapture.stopDetectPowerPressed();
}
export const CloudPreventCaptureEvents = new NativeEventEmitter(
  CloudPreventCapture
);
export const { ON_SCREENSHOT, ON_SCREEN_CAPTURE } =
  CloudPreventCapture.getConstants();

export type CloudScreenCaptureEvent = {
  isCaptured: boolean;
};

export type CloudScreenShotEvent = {
  isScreenShot: boolean;
};
