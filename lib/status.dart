import 'package:equatable/equatable.dart';
import 'package:xml/xml.dart';

class WledStatus extends Equatable {
  WledStatus({required this.brightness});

  final int brightness;
  // final int rgb;

  bool get isOn => brightness > 0;

  factory WledStatus.fromXml(String xml) {
    final doc = XmlDocument.parse(xml);

    final data = doc.getElement('vs')!;
    return WledStatus(
      brightness: int.tryParse(data.getElement('ac')!.innerText) ?? 0,
      // rgb: int.tryParse()
    );
  }

  @override
  List<Object> get props => [brightness];

  @override
  bool get stringify => true;
}
