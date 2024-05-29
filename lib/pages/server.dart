import 'package:flutter/material.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:volume_controller/functions/server.dart';

class ServerPage extends StatefulWidget {
  const ServerPage({super.key});

  @override
  State<ServerPage> createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  double _volume = 0.0;
  @override
  void initState() {
    super.initState();
    server();
    FlutterVolumeController.addListener((x) => setState(() => _volume = x));
  }

  @override
  void dispose() {
    FlutterVolumeController.removeListener();
    super.dispose();
  }

  final _green = Color(0xFF00FF00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(
              Icons.volume_up_outlined,
              color: _green,
            ),
            Text(
              '${(_volume * 100).toStringAsFixed(0)}%',
              style: TextStyle(color: _green),
            ),
            RotatedBox(
              quarterTurns: -1,
              child: Slider(
                activeColor: _green,
                thumbColor: _green,
                divisions: 100,
                min: 0,
                max: 1,
                value: _volume,
                inactiveColor: _green,
                onChanged: (x) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
