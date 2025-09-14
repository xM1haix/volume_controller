import "package:flutter/material.dart";
import "package:flutter_volume_controller/flutter_volume_controller.dart";

///[Future] which change the volume based on the [x]
Future<void> volume(Map<String, dynamic> x) async => switch (x) {
      {"SET": final num set} =>
        await FlutterVolumeController.setVolume(set.toDouble() / 100),
      {"MUTE": final bool _} => await FlutterVolumeController.toggleMute(),
      _ => debugPrint("wrong type")
    };
