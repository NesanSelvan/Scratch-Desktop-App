import 'package:bloc/bloc.dart';

part 'loader_state.dart';

class LoaderCubit extends Cubit<LoaderState> {
  LoaderCubit() : super(LoaderState(progress: 0));

  void updateLoading(int progress) {
    emit(
      state.copyWith(
        progress: progress,
        loadingState: progress >= 100 || progress <= 0
            ? LoadingState.loaded
            : LoadingState.loading,
      ),
    );
  }

  void updateLoadingState(LoadingState loadingState) {
    emit(
      state.copyWith(
        loadingState: loadingState,
      ),
    );
  }
}
