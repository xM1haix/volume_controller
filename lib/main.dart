import 'package:flutter/material.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _volume = 0.0;
  bool mute = false;
  @override
  void initState() {
    super.initState();
    FlutterVolumeController.addListener((x) => setState(() => _volume = x));
  }

  @override
  void dispose() {
    FlutterVolumeController.removeListener();
    super.dispose();
  }

  Future<void> checkMute() async {
    final cache = await FlutterVolumeController.getMute();
    if (cache != mute && cache != null) {
      setState(() => mute = cache);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color() => mute ? Colors.grey : const Color(0xFF5BE727);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconButton(
              onPressed: () async {
                await FlutterVolumeController.toggleMute();
                checkMute();
              },
              icon: Icon(
                mute ? Icons.volume_off_outlined : Icons.volume_up_outlined,
                color: color(),
              ),
            ),
            Text(
              '${(_volume * 100).toStringAsFixed(0)}%',
              style: TextStyle(color: color()),
            ),
            RotatedBox(
              quarterTurns: -1,
              child: Slider(
                activeColor: color(),
                thumbColor: color(),
                divisions: 100,
                min: 0,
                max: 1,
                value: _volume,
                onChanged: (x) {
                  FlutterVolumeController.setVolume(x);
                  checkMute();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
