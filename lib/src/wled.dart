import 'dart:convert';
import 'dart:io' show HttpClient, HttpClientResponse;

import 'status.dart';
import 'color.dart';

/// Use this class to send commands to WLED instance.
///
/// It implements simple stateless request-response mechanism
/// and don't reuse connection between commands.
/// Use it for one shot operations.
class Wled {
  /// Host or IP
  final String host;

  late final HttpClient _http = HttpClient();

  /// Create new WLED control.
  ///
  /// [host] - is a hostname (e.g. `localhost`)
  /// or an IPv4 address (e.g. `192.168.1.123`).
  Wled(this.host);

  /// Turn off LED.
  Future<void> turnOff() async {
    await _request([_Op.turnOff]);
  }

  /// Turn on LED.
  Future<void> turnOn() async {
    await _request([_Op.turnOn]);
  }

  /// Toggle LED.
  Future<void> toggle() async {
    await _request([_Op.toggle]);
  }

  /// Get WLED status.
  Future<WledStatus> status() async {
    final resp = await _request([]);
    final body = await resp.transform(utf8.decoder).join();

    // print(body);
    return WledStatus.fromXml(body);
  }

  /// Set main color.
  Future<void> color(Color color) async {
    final r = color.r.clamp(0, 255);
    final g = color.g.clamp(0, 255);
    final b = color.b.clamp(0, 255);

    await _internalRequest('&R=$r&G=$g&B=$b');
  }

  /// Set brightness (0-255).
  Future<void> brightness(int value) async {
    final newValue = value.clamp(0, 255);
    await _internalRequest("&A=$newValue");
  }

  Future<HttpClientResponse> _request(List<_Op> operations) async {
    return _internalRequest(operations.asParameters());
  }

  Future<HttpClientResponse> _internalRequest(String params) async {
    final path = '/win$params';
    final req = await _http.get(host, 80, path);
    final resp = await req.close();

    return resp;
  }
}

extension _OpExt on List<_Op> {
  String asParameters() {
    if (isEmpty) return '';

    // ignore: prefer_interpolation_to_compose_strings
    return '&' + map((it) => '${it.name}=${it.value}').join('&');
  }
}

enum _Op {
  turnOff('T', '0'),
  turnOn('T', '1'),
  toggle('T', '2'),
  ;

  const _Op(this.name, this.value);

  final String name;
  final String value;
}
