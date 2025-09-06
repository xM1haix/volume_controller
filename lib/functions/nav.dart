import "package:flutter/material.dart";

void back(BuildContext context, [x]) => Navigator.pop(context, x);
Future<void> nav(BuildContext context, Widget location) => Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => location,
      ),
    );
