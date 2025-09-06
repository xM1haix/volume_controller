import "package:flutter/material.dart";
import "package:flutter_volume_controller/flutter_volume_controller.dart";

void volume(x) => switch (x) {
      {"SET": final num set} =>
        FlutterVolumeController.setVolume(set.toDouble() / 100),
      {"MUTE": final bool _} => FlutterVolumeController.toggleMute(),
      _ => debugPrint("wrong type")
    };
