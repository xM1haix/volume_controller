import "package:volume_controller/functions/err.dart";

class VolumeData {
  const VolumeData({
    required this.value,
    required this.muted,
  });
  factory VolumeData.fromJson(Map<String, dynamic> x) => switch (x) {
        {
          "value": final num value,
          "muted": final bool muted,
        } =>
          VolumeData(
            value: value.toDouble(),
            muted: muted,
          ),
        _ => throw cfe(VolumeData, x),
      };
  final double value;
  final bool muted;
}
