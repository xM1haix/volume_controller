import "package:flutter/material.dart";

///Shorter and reusable function to close or go back
void back(BuildContext context, [x]) => Navigator.pop(context, x);

///Shorter and reusable function to navigate to [location]
Future<void> nav(BuildContext context, Widget location) => Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => location,
      ),
    );
