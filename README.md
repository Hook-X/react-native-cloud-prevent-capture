# react-native-cloud-prevent-capture

Package to prevent screen recording(on both platform ios and android) and screenshots (only on android)

## Installation

```sh
npm install react-native-cloud-prevent-capture
```

## Usage

```js
import CloudPreventCaptureModule from "react-native-cloud-prevent-capture";
import { multiply, startPreventCapture, stopPreventCapture } from "react-native-cloud-prevent-capture";

// ...

const result = await multiply(3, 7);


const { ON_SCREEN_CAPTURE, ON_SCREENSHOT } = CloudPreventCaptureModule.getConstants();
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT