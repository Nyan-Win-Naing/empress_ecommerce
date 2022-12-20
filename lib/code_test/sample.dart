import 'package:flutter/widgets.dart';
import 'package:stream_transform/stream_transform.dart';

void main() {
  Stream<int> intStream = Stream.fromIterable([1, 2, 3, 4, 5, 6]);
  Stream<int> newIntStream = intStream.startWith(100).map((number) {
    print(number);
    return number;
  });

  newIntStream.listen((number) {
    print("Number is $number");
  }).onError((error) {
    debugPrint(error.toString());
  });
}
