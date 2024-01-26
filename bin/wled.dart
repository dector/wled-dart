import 'dart:io';

import 'package:wled/status.dart';
import 'package:wled/wled.dart';

void main() async {
  late WledStatus status;
  final wled = Wled('192.168.1.43');

  print("Toggling...");
  await wled.toggle();
  status = await wled.status();
  print('Turned On: ${status.isOn}');

  print('');
  await Future.delayed(Duration(seconds: 1));

  print("Toggling...");
  await wled.toggle();
  status = await wled.status();
  print('Turned On: ${status.isOn}');

  exit(0);
}
