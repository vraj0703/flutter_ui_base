import 'package:flutter/material.dart';
import 'package:flutter_ui_base/flutter_ui_base.dart';
import 'package:flutter_ui_base/presentation/controls/app_loading_indicator.dart';
import 'package:flutter_ui_base/presentation/controls/buttons.dart';
import 'package:flutter_ui_base/presentation/widgets/app_backdrop.dart';
import 'package:flutter_ui_base/presentation/widgets/app_rich_text.dart';
import 'package:gap/gap.dart';
import 'package:my_localizations/library.dart';
import 'package:my_theme_style/styles/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  final style = AppStyle();
  final localizations = await AppLocalizations.delegate.load(
    const Locale('en'),
  );

  await FlutterUiBase.initialize(style: style, localizations: localizations);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Base Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter UI Base Catalog')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(context, 'Core Widgets', [
            _buildDemoItem(context, 'AppBackdrop', const AppBackdropDemo()),
            _buildDemoItem(context, 'AppRichText', const AppRichTextDemo()),
            _buildDemoItem(context, 'Buttons', const ButtonsDemo()),
            _buildDemoItem(
              context,
              'AppLoadingIndicator',
              const LoadingIndicatorDemo(),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(
      BuildContext context,
      String title,
      List<Widget> children,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        ...children,
        const Divider(),
      ],
    );
  }

  Widget _buildDemoItem(BuildContext context, String title, Widget demoPage) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => demoPage),
        ),
      ),
    );
  }
}

class AppBackdropDemo extends StatelessWidget {
  const AppBackdropDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBackdrop')),
      body: Stack(
        children: [
          Center(
            child: Text('Background Content', style: TextStyle(fontSize: 30)),
          ),
          AppBackdrop(
            strength: 10,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.white.withValues(alpha: 0.5),
                child: Text('Foreground'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppRichTextDemo extends StatelessWidget {
  const AppRichTextDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppRichText')),
      body: Center(
        child: AppRichText(
          text: 'This is *bold* and _italic_ text.',
          defaultTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}

class ButtonsDemo extends StatelessWidget {
  const ButtonsDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBtn(
              onPressed: () {},
              semanticLabel: "appBtn",
              child: const Text('AppBtn'),
            ),
            const Gap(20),
            AppBtn.basic(
              onPressed: () {},
              semanticLabel: "appBtn",
              child: const Text('AppBtn.basic'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingIndicatorDemo extends StatelessWidget {
  const LoadingIndicatorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppLoadingIndicator')),
      body: const Center(child: AppLoadingIndicator()),
    );
  }
}
