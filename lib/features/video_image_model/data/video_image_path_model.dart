import 'dart:io';

class VideoImagePathModel {
  VideoImagePathModel({
    this.totalVideoDuration,
    this.file,
    this.videoQuality = 5000,
  });

  //main
  File? file;

  //merge videos
  int? totalVideoDuration;



  //quality
  int videoQuality;

  //final save path
  String finalSavePath = '';
}









