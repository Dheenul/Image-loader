import 'dart:async';

class Stream {
  StreamController dataFlowController = StreamController();
  int number = 0;
  Timer? _timer;
  addDataToStream() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      dataFlowController.add(number);
      number++;
    });
  }

  Future stopTimer() async {
    await Future.delayed(const Duration(minutes: 1));
    _timer?.cancel();
  }

  void dispose() {
    dataFlowController.done;
  }
}

void main(List<String> args) async {
  Stream stream = Stream();
  stream.dataFlowController.stream.listen((event) {
    print(
        "Final data after incrementing the number by 1 for 1 minute is $event");
  });
  stream.addDataToStream();
  await stream.stopTimer();
  stream.dispose();
}
