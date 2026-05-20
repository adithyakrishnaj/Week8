import '../models/counter_model.dart';

class CounterController {

  final CounterModel model = CounterModel();

  int get counterValue => model.counter;

  void increment() {
    model.counter++;
  }

  void decrement() {
    model.counter--;
  }

  void reset() {
    model.counter = 0;
  }
}