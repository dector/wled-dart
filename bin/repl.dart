import 'dart:io';

import 'package:wled/wled.dart';

void main() async {
  final wled = Wled('192.168.1.43');
  final status = await wled.status();

  print('${wled.host} => $status');

  exit(0);
}
