import 'package:flutter/material.dart';

back(context, [x]) => Navigator.pop(context, x);
nav(context, Widget location) => Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => location,
      ),
    );
