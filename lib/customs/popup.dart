import 'package:flutter/material.dart';

import '/functions/nav.dart';

Future<bool?> confirmPopUp({
  required BuildContext context,
  required String question,
  required String details,
}) =>
    popup<bool?>(
      context: context,
      title: Text(question),
      content: Text(details),
      actions: [
        ("Yes", true),
        ("No", false),
      ],
    );

Future<void> errorPopup(BuildContext context, e) async {
  await popup(
    context: context,
    title: const Text('Something went wrong!'),
    content: Text(e.toString()),
    actions: [("Ok!", null)],
  );
}

Future infoPopUp({
  required BuildContext context,
  required String title,
  String? content,
}) =>
    popup(
      context: context,
      title: Text(title),
      content: content != null ? Text(content) : null,
      actions: [("Ok!", null)],
    );

Future<T?> popup<T>({
  required BuildContext context,
  required List<(String text, T value)> actions,
  Widget? title,
  Widget? content,
  bool dismissible = true,
}) =>
    showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        actionsAlignment: actions.length == 1
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceEvenly,
        title: title,
        content: content,
        actions: actions
            .map(
              (e) => TextButton(
                child: Text(e.$1),
                onPressed: () => back(context, e.$2),
              ),
            )
            .toList(),
      ),
    );
void loading(BuildContext context) => popup(
      dismissible: false,
      context: context,
      actions: [],
      content: const SizedBox(
        height: 50,
        width: 50,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
