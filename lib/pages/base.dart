import "package:flutter/material.dart";
import "package:volume_controller/functions/nav.dart";
import "package:volume_controller/pages/controller.dart";
import "package:volume_controller/pages/server.dart";

///Base Page
class BasePage extends StatelessWidget {
  ///
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconButton(
              onPressed: () => nav(context, const ServerPage()),
              icon: const Icon(
                Icons.monitor,
              ),
            ),
            IconButton(
              onPressed: () => nav(context, const ControllerPage()),
              icon: const Icon(
                Icons.phone,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
