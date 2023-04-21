<div align="center">
  <a href="https://xcode.pineapple.build">
    <img src="https://github.com/Dhamova/Pineapple-Xcode/blob/eae2e638132232c9c48c1c78110cc94f30edec13/PineappleXcode/Assets.xcassets/AppIcon.appiconset/mac256.png?raw=true" alt="Logo" width="200" height="200">
  </a>
  <h1>Pineapple for Xcode</h1>
  Open-source extension for Xcode that enhances development on Apple platforms with OpenAI's ChatGPT functionalities.
  <br />
  <br />
  <a href="https://xcode.pineapple.build">Docs</a>
  •
  <a href="#">Support Us: Download on the AppStore (soon)</a>
  •
  <a href="#">Join TestFlight (soon)</a>
</div>

<div align="center">
<br />
</div>

<div align="center">
  <a href="https://xcode.pineapple.build">
    <img alt+"Pineapple for Xcode UI Screenshot" src="https://github.com/Dhamova/Pineapple-Xcode/blob/536367e92bd515a44f4a0430063618f4c947deed/PineappleXcode/Preview%20Content/UIScreenshot.png?raw=true" width="75%">
  </a>
</div>

|Generate|Document|Refactor|
|--|--|--|
|![Generate](https://user-images.githubusercontent.com/10634238/233713729-865a7275-0b5b-4269-9a86-ab62f65cceb6.gif)|![Document](https://user-images.githubusercontent.com/10634238/233713762-05900142-8a25-4c4a-8e20-c8455382927a.gif)|![Refactor](https://user-images.githubusercontent.com/10634238/233713792-8e8a9d59-ed01-4ac6-9c5c-998d48095b45.gif)|


## Table of Contents
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Usage](#usage)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Support](#support)
- [License](#license)
- [Acknowledgements](#acknowledgements)
- [Copyright](#copyright)

## Getting Started
### Prerequisites
Make sure you are using `Xcode Version 14.3 (14E222b)` or newer. The project is `Xcode 14.0-compatible`.

The `macOS` App requires `macOS 13.3+`

### Setup
1. Clone this Repository
2. Open the Xcode Project, go to the Project Targets, and update the `Signing & Capabilities` with your own `Bundle Identifier`.
3. you shouldn't need a `Provisioning Profile` to run the extension locally.
4. Make sure you run the `Pineapple for Xcode` macOS target first, and add your OpenAI API Key
5. To debug the extension, run the `Pineapple` extension target, and a new instance of Xcode will open with the extension enabled.

### Usage
Refer to our [Docs](https://xcode.pineapple.build) to learn how to use this extension.

## Roadmap
#### Mac App UI
- [x] Add/Remove OpenAPI Key
- [x] Store API Key securely with Apple's Keychain
- [ ] Add GPT customizations (Model, Max Tokens, Temperature, etc)
- [ ] Add a loading state while executing a command
#### Xcode Commands
- [x] Refactor Selected Code
- [x] Shorten Selected Code
- [x] Generate Code from current single-line comment
- [ ] Generate Code from selected multi-line comments
- [x] Document Selected Code
- [ ] Find Potential Bugs in Selected Code
- [ ] Fully Support Swift, SwiftUI, Obj-C, Obj-C++, C, C++

## Contributing
Any contributions you make will benefit everybody else and are greatly appreciated 🍍.

Please try to create bug reports that are:

Reproducible. Include steps to reproduce the problem.
Specific. Include as much detail as possible: which version, what environment, etc.
Unique. Do not duplicate existing opened issues.
Scoped to a Single Bug. One bug per report.
Please adhere to this project's code of conduct.

## License
This project is licensed under the AGPL-3.0 license.

See [LICENSE](LICENSE) for more information.

## Acknowledgements
Thanks for [dec0dOS](https://github.com/dec0dOS/amazing-github-template) for the README template.

## Copyright
The Pineapple logo, and Dhamova logo are a registered trademark of Dhamova Innovations Inc.






