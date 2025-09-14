import "package:volume_controller/classes/volume_data.dart";
import "package:volume_controller/functions/err.dart";

///The main object which is transfered
class AllData {
  ///Construction of the [AllData]
  const AllData({
    required this.volumeData,
  });

  ///factory [AllData.fromJson] which takes
  ///[x] as [Map] and checks for the correct format
  factory AllData.fromJson(Map<String, dynamic> x) => switch (x) {
        {
          "volumeData": final dynamic volumeData,
        } =>
          AllData(
            volumeData: VolumeData.fromJson(volumeData),
          ),
        _ => throw cfe(AllData, x),
      };

  ///The [VolumeData]
  final VolumeData volumeData;
}
