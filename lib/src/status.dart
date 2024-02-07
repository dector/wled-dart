import 'package:xml/xml.dart';

class WledStatus {
  final String name;
  final int brightness;

  WledStatus({
    required this.name,
    required this.brightness,
  });

  bool get isOn => brightness > 0;

  factory WledStatus.fromXml(String xml) {
    final doc = XmlDocument.parse(xml);

    final data = doc.getElement('vs')!;
    return WledStatus(
      name: data.getElement('ds')?.innerText ?? '',
      brightness: int.tryParse(data.getElement('ac')!.innerText) ?? 0,
    );
  }

  @override
  String toString() => 'WLED[$name] { ' + 'brightness: $brightness ' + '}';

  @override
  bool operator ==(Object other) {
    if (other is! WledStatus) return false;
    if (other.runtimeType != runtimeType) return false;
    if (other.name != name) return false;
    if (other.brightness != brightness) return false;

    return true;
  }

  @override
  int get hashCode {
    return Object.hash(name, brightness);
  }
}
