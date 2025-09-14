import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/domain/models/dialog.dart';

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
      title: Text(
        data.title,
        style: Theme.of(
          context,
        ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w400),
      ),
      content: data.message != null
          ? Text(data.message!, style: Theme.of(context).textTheme.bodyLarge)
          : null,
      actions: <Widget>[
        TextButton(
          child: Text(
            data.leftOption,
            style: Theme.of(context).textTheme.labelLarge!,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            data.leftClicked();
          },
        ),
        if (data.rightOption != null)
          TextButton(
            child: Text(
              data.rightOption!,
              style: Theme.of(context).textTheme.labelLarge,
            ),
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
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          data.title,
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: data.message != null
            ? Text(data.message!, style: Theme.of(context).textTheme.bodyLarge)
            : null,
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            data.leftOption,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            data.leftClicked();
          },
        ),
        if (data.rightOption != null)
          TextButton(
            child: Text(
              data.rightOption!,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              if (data.rightClicked != null) data.rightClicked!();
            },
          ),
      ],
    );
  }
}
