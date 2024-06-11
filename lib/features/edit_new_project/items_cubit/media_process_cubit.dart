import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_editor/video_editor.dart';

import '/core/utils/shared_storage.dart';
import '/features/edit_new_project/items_cubit/media_process_state.dart';

class MediaProcessCubit extends Cubit<MediaProcessState> {
  MediaProcessCubit() : super(InitialProcessMediaProcessState()) {
    // Listen to changes in the video path

    SharedStorage.videoPathNotifier.addListener(_updateController);
    _updateController(); // Initialize the controller with the initial video path
  }

  final exportingProgress = ValueNotifier<double>(0.0);
  final isExporting = ValueNotifier<bool>(false);
  final double height = 60.0;

  late VideoEditorController controller;

  void _updateController() {
    final videoPath = SharedStorage.videoPathNotifier.value;
    final int videoMaxDuration = SharedStorage.getVideoDuration();
    if (videoPath.isNotEmpty) {
      final file = File(videoPath);
      controller = VideoEditorController.file(
        file,
        coverThumbnailsQuality: 2,trimThumbnailsQuality: 2,
        //trimStyle: TrimSliderStyle(),
        minDuration: const Duration(seconds: 1),
        //maxDuration: Duration(seconds: SharedStorage.getVideoDuration()),
        maxDuration:  Duration(seconds: 25),
      );

      // Reinitialize the controller
      controller.initialize(aspectRatio: 9 / 16).then((_) {
        emit(ControllerUpdated());
      }).catchError(
        (error) {
          // Handle error
        },
        test: (e) => e is VideoMinDurationError,
      );
    }
  }

  @override
  Future<void> close() {
    SharedStorage.videoPathNotifier.removeListener(_updateController);
    controller.dispose();
    return super.close();
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0')
      ].join(":");
}
