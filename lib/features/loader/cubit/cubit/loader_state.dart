part of 'loader_cubit.dart';

enum LoadingState { loaded, loading }

class LoaderState {
  final int progress;
  final LoadingState loadingState;
  LoaderState({
    required this.progress,
    this.loadingState = LoadingState.loaded,
  });

  LoaderState copyWith({
    int? progress,
    LoadingState? loadingState,
  }) {
    return LoaderState(
      progress: progress ?? this.progress,
      loadingState: loadingState ?? this.loadingState,
    );
  }

  @override
  String toString() =>
      'LoaderState(progress: $progress, loadingState: $loadingState)';

  @override
  bool operator ==(covariant LoaderState other) {
    if (identical(this, other)) return true;

    return other.progress == progress && other.loadingState == loadingState;
  }

  @override
  int get hashCode => progress.hashCode ^ loadingState.hashCode;
}
