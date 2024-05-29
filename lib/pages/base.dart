import 'package:flutter/material.dart';
import 'package:volume_controller/pages/controller.dart';

import '../functions/nav.dart';
import 'server.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => nav(context, ServerPage()),
              icon: Icon(
                Icons.monitor,
              ),
            ),
            IconButton(
              onPressed: () => nav(context, ControllerPage()),
              icon: Icon(
                Icons.phone,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
