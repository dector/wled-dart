import 'dart:io';

import 'package:wled/wled.dart';

void main() async {
  late WledStatus status;
  final wled = Wled('192.168.1.43');

  print("Turning off...");
  await wled.turnOff();
  status = await wled.status();
  print('Turned On: ${status.isOn}');

  print('');
  await Future.delayed(Duration(seconds: 1));

  print("Turning on...");
  await wled.turnOn();
  status = await wled.status();
  print('Turned On: ${status.isOn}');

  await Future.delayed(Duration(seconds: 1));

  print("Changing to red...");
  await wled.color(Colors.red);
  status = await wled.status();

  await Future.delayed(Duration(seconds: 1));

  print("Changing to green...");
  await wled.color(Colors.green);
  status = await wled.status();

  await Future.delayed(Duration(seconds: 1));

  print("Changing to blue...");
  await wled.color(Colors.blue);
  status = await wled.status();

  await Future.delayed(Duration(seconds: 1));

  print("Changing to white...");
  await wled.color(Colors.white);
  status = await wled.status();

  print('');
  await Future.delayed(Duration(seconds: 1));

  print("Changing to warm white...");
  await wled.color(Colors.warmWhite);
  status = await wled.status();

  print('');
  await Future.delayed(Duration(seconds: 1));

  print("Changing to orange...");
  await wled.color(Colors.orange);
  status = await wled.status();

  print('');
  await Future.delayed(Duration(seconds: 1));

  print("Toggling...");
  await wled.toggle();
  status = await wled.status();
  print('Turned On: ${status.isOn}');

  exit(0);
}
