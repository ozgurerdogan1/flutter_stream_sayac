import 'dart:async';

class SayacViewModel {
  int _sayac = 0;
  final StreamController<int> _controller = StreamController<int>.broadcast();
  Stream<int> get sayacStream => _controller.stream;
  Sink<int> get _sayacSink => _controller.sink;

  SayacViewModel() {
    _sayacSink.add(_sayac); // broadcast kullanıldığında init kullanılmalı..
  }

  int init() {
    return _sayac;
  }

  void arttir() {
    _sayacSink.add(++_sayac);
  }

  void azalt() {
    _sayacSink.add(--_sayac);
  }
}
