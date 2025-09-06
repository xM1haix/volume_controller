import "package:volume_controller/classes/volume_data.dart";
import "package:volume_controller/functions/err.dart";

class AllData {
  const AllData({
    required this.volumeData,
  });
  factory AllData.fromJson(Map<String, dynamic> x) => switch (x) {
        {
          "volumeData": final dynamic volumeData,
        } =>
          AllData(
            volumeData: VolumeData.fromJson(volumeData),
          ),
        _ => throw cfe(AllData, x),
      };
  final VolumeData volumeData;
}
