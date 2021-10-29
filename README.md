# react-native-cloud-prevent-capture

Package to prevent screen recording(on both platform ios and android) and screenshots (only on android)

## Installation

```sh
npm install react-native-cloud-prevent-capture
```

## Usage

```js
import { multiply, startPreventCapture, stopPreventCapture,
  ON_SCREEN_CAPTURE,
  ON_SCREENSHOT,
  CloudPreventCaptureEvents
} from "react-native-cloud-prevent-capture";

// ...

const result = await multiply(3, 7);

//Launch this on pages where yo want to prevent recording and screenshots
try {
  const result = await startPreventCapture();
} catch (err) {
  console.log("%c++ START PREVENT ERROR", "background: red", err);
}
// When you leave secure page
try {
  const result = await stopPreventCapture();
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
