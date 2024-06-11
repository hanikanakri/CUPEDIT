abstract class MergeVideosState {}

class InitialMergeVideos extends MergeVideosState {}

class LoadMergeVideos extends MergeVideosState {}

class SuccessMergeVideos extends MergeVideosState {}

class CancelMergeVideos extends MergeVideosState {}

class ErrorMergeVideos extends MergeVideosState {
  final String? message;

  ErrorMergeVideos({
    this.message,
  });
}
