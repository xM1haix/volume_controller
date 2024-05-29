import 'package:volume_controller/functions/err.dart';

class VolumeData {
  final double value;
  final bool muted;
  const VolumeData({
    required this.value,
    required this.muted,
  });
  factory VolumeData.fromJson(Map<String, dynamic> x) => switch (x) {
        {
          "value": num value,
          "muted": bool muted,
        } =>
          VolumeData(
            value: value.toDouble(),
            muted: muted,
          ),
        _ => throw cfe(VolumeData, x),
      };
}
