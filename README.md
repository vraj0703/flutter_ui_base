# Flutter UI Base

A Flutter plugin that provides a base UI architecture, including theme styles, localizations, and a set of core widgets and controls.

## Installation

Add `flutter_ui_base` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_ui_base:
    path: ../ # Or git url
```

## Initialization

Before using any widgets from `flutter_ui_base`, you must initialize the plugin in your `main.dart`. This involves setting up `AppStyle` and `AppLocalizations`.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_ui_base/common_libs.dart';
import 'package:flutter_ui_base/flutter_ui_base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize AppStyle
  final style = AppStyle();

  // Initialize AppLocalizations (load default locale, e.g., English)
  final localizations = await AppLocalizations.delegate.load(const Locale('en'));

  // Initialize FlutterUiBase
  await FlutterUiBase.initialize(
    style: style,
    localizations: localizations,
  );

  runApp(const MyApp());
}
```

## Usage

Once initialized, you can use the widgets and utilities provided by the library.

### Core Widgets

- **AppBtn**: A customizable button.
- **AppBackdrop**: A backdrop widget with blur support.
- **AppRichText**: A rich text widget with tag parsing.
- **AppLoadingIndicator**: A circular loading indicator.

### Accessing Styles and Localizations

You can access styles and localizations globally using the provided getters:

```dart
// Access colors
final primaryColor = $colors.primary;

// Access text styles
final bodyStyle = $styles.text.bodyMedium;

// Access localizations
final title = $strings.title;
```

## Example

Check the `example` directory for a complete sample application.
