<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

[autoit-v3](https://www.autoitscript.com/autoit3/docs/) script compiler, only supports Windows.

_AutoIt v3 is a freeware BASIC-like scripting language designed for automating the Windows GUI and general scripting. It uses a combination of simulated keystrokes, mouse movement and window/control manipulation in order to automate tasks in a way not possible or reliable with other languages._

## Features

- run autoit-v3 script;

- compile autoit-v3 script to an executable file;

## Installation

```shell
dart pub add autoit_script_compiler
```

## Usage

** create a file named "script.au3", content is as follows: **

```shell
MsgBox(64, "guide", "Hello, world!")
```

```dart
import 'package:autoit_script_compiler/autoit_script_compiler.dart' as autoit;

void main() async {
  await autoit.run("./example/script.au3"); // run autoit script
  // or
  await autoit.compile("./example/script.au3", target: "./script.exe"); // compile autoit script
}

```
