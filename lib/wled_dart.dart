import 'dart:io' show HttpClient, HttpClientResponse;

class Wled {
  final String host;

  late final HttpClient _http;

  /// Create new WLED control.
  Wled(this.host) {
    _http = HttpClient();
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
    return map((it) => switch (it) {
          _Op.toggle => '&T=2',
        }).join();
  }
}

enum _Op {
  toggle('&T=2'),
  ;

  const _Op(this.arg);

  final String arg;
}
