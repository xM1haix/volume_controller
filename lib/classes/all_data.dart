import '/functions/err.dart';
import 'volume_data.dart';

class AllData {
  final VolumeData volumeData;
  const AllData({
    required this.volumeData,
  });
  factory AllData.fromJson(Map<String, dynamic> x) => switch (x) {
        {
          "volumeData": dynamic volumeData,
        } =>
          AllData(
            volumeData: VolumeData.fromJson(volumeData),
          ),
        _ => throw cfe(AllData, x),
      };
}
