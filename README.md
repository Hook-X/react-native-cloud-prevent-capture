# react-native-cloud-prevent-capture

Package to prevent screen recording(on both platform ios and android) and screenshots (only on android)

## Installation

```sh
npm install react-native-cloud-prevent-capture
```

## Usage

```js
import { startPreventingRecording, stopPreventingRecording,
  ON_SCREEN_CAPTURE,
  ON_SCREENSHOT,
  CloudPreventCaptureEvents
} from "react-native-cloud-prevent-capture";

// ...

//Launch this on pages where yo want to prevent recording and screenshots
try {
  const result = await startPreventingRecording();
} catch (err) {
  console.log("%c++ START PREVENT ERROR", "background: red", err);
}
// When you leave secure page
try {
  const result = await stopPreventingRecording();
} catch (err) {
  console.log("%c++ STOP PREVENT ERROR", "background: red", err);
}
//Listening to event on ios
CloudPreventCaptureEvents.addListener(
  ON_SCREEN_CAPTURE,
  res => console.log("Do something")
)
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
