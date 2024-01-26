import 'dart:io';

import 'package:wled_dart/wled_dart.dart';

void main() async {
  final wled = Wled('192.168.1.43');

  print("Toggle 1...");
  await wled.toggle();

  await Future.delayed(Duration(seconds: 1));

  print("Toggle 2...");
  await wled.toggle();

  exit(0);
}
