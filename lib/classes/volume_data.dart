import "package:volume_controller/functions/err.dart";

///Object which represent the Volume data
class VolumeData {
  ///Construction of the [VolumeData]
  const VolumeData({
    required this.value,
    required this.muted,
  });

  ///factory [VolumeData.fromJson] which takes the [Map]
  ///[x] and checks for the correct format
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

  ///The value of the volume
  final double value;

  ///The value of the togle [muted]
  final bool muted;
}
