import 'dart:io';

import 'package:wled/wled.dart';

void main() async {
  final wled = Wled('192.168.1.43');
  wled.brightness(50);

  exit(0);
}
