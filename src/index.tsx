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

export function multiply(a: number, b: number): Promise<number> {
  return CloudPreventCapture.multiply(a, b);
}
export function startPreventingRecording(): Promise<boolean> {
  return CloudPreventCapture.startPreventingRecording();
}
export function stopPreventingRecording(): Promise<boolean> {
  return CloudPreventCapture.stopPreventingRecording();
}
export const CloudPreventCaptureEvents = new NativeEventEmitter(
  CloudPreventCapture
);
export const { ON_SCREENSHOT, ON_SCREEN_CAPTURE } =
  CloudPreventCapture.getConstants();
