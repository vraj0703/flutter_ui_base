import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_core/core/models/dialog.dart';
import 'package:flutter_ui_base/common_libs.dart';

void showDialogInfo({
  required BuildContext context,
  required DialogEssentials dialogInfo,
  Function()? dialogClosed,
}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BaseDialog(data: dialogInfo);
    },
  ).whenComplete(() {
    if (dialogClosed != null) {
      dialogClosed();
    }
  });
}

class BaseDialog extends StatelessWidget {
  final DialogEssentials data;

  const BaseDialog({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return AndroidDialog(data: data);
    } else {
      return IosDialog(data: data);
    }
  }
}

class AndroidDialog extends StatelessWidget {
  final DialogEssentials data;

  const AndroidDialog({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(data.title, style: Theme.of(context).textTheme.displayMedium),
      content: data.message != null
          ? Text(data.message!, style: $textStyle.bodyLarge)
          : null,
      actions: <Widget>[
        TextButton(
          child: Text(data.leftOption, style: $textStyle.labelLarge),
          onPressed: () {
            Navigator.of(context).pop();
            data.leftClicked();
          },
        ),
        if (data.rightOption != null)
          TextButton(
            child: Text(data.rightOption!, style: $textStyle.labelLarge),
            onPressed: () {
              Navigator.of(context).pop();
              if (data.rightClicked != null) data.rightClicked!();
            },
          ),
      ],
    );
  }
}

class IosDialog extends StatelessWidget {
  final DialogEssentials data;

  const IosDialog({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: $insets.md),
        child: Text(data.title, style: $textStyle.displayMedium),
      ),
      content: Padding(
        padding: EdgeInsets.only(top: $insets.sm),
        child: data.message != null
            ? Text(data.message!, style: $textStyle.bodyLarge)
            : null,
      ),
      actions: <Widget>[
        TextButton(
          child: Text(data.leftOption, style: $textStyle.labelLarge),
          onPressed: () {
            Navigator.of(context).pop();
            data.leftClicked();
          },
        ),
        if (data.rightOption != null)
          TextButton(
            child: Text(data.rightOption!, style: $textStyle.labelLarge),
            onPressed: () {
              Navigator.of(context).pop();
              if (data.rightClicked != null) data.rightClicked!();
            },
          ),
      ],
    );
  }
}
