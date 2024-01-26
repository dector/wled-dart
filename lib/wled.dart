import 'dart:io' show HttpClient, HttpClientResponse;

/// Use this class to send commands to WLED instance.
///
/// It implements simple stateless request-response mechanism
/// and don't reuse connection between commands.
/// Use it for one shot operations.
class Wled {
  /// Host
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

  Future<HttpClientResponse> _request(List<_Op> operations) async {
    final path = '/win${operations.asParameters()}';
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
