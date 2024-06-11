import '/core/utils/shared_storage.dart';

class Commands {
  static String mergeVideosCommand(
      {String? inputPath1, String? inputPath2, String? outPath}) {
    int videoQuality = SharedStorage.getVideoQuality();
    final String command =
        '-i $inputPath1 -i $inputPath2 -filter_complex "[0:v][0:a][1:v][1:a]concat=n=2:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -b:v ${videoQuality}k -y $outPath';

    return command;
  }
}
