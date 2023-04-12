import 'dart:async';

import 'package:annai_store/features/loader/cubit/loader_event.dart';

class LoaderBloc {
  int _progress = 0;

  final _progressStateController = StreamController<int>();
  StreamSink<int> get _inProgress => _progressStateController.sink;
  Stream<int> get progress => _progressStateController.stream;

  final _progressEventController = StreamController<UpdateProgress>();
  Sink<UpdateProgress> get counterEventSink => _progressEventController.sink;

  LoaderBloc() {
    _progressEventController.stream.listen(_mapEventToState);
  }

  _mapEventToState(UpdateProgress event) {
    _progress = event.progress;

    _inProgress.add(_progress);
  }

  void dispose() {
    _progressStateController.close();
    _progressEventController.close();
  }
}
