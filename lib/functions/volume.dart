import 'package:flutter_volume_controller/flutter_volume_controller.dart';

void volume(x) => switch (x) {
      {"SET": num set} =>
        FlutterVolumeController.setVolume(set.toDouble() / 100),
      {"MUTE": bool value} => FlutterVolumeController.toggleMute(),
      _ => print('wrong type')
    };
