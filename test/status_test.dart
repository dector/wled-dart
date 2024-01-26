import 'package:test/test.dart';
import 'package:wled/status.dart';

const xml = '''
<?xml version="1.0" ?>
<vs>
  <ac>10</ac>
  <cl>255</cl>
  <cl>255</cl>
  <cl>255</cl>
  <cs>0</cs>
  <cs>0</cs>
  <cs>0</cs>
  <ns>0</ns>
  <nr>0</nr>
  <nl>0</nl>
  <nf>1</nf>
  <nd>60</nd>
  <nt>0</nt>
  <fx>0</fx>
  <sx>128</sx>
  <ix>128</ix>
  <fp>0</fp>
  <wv>-1</wv>
  <ws>0</ws>
  <ps>0</ps>
  <cy>0</cy>
  <ds>WLED</ds>
  <ss>0</ss>
</vs>
''';

void main() {
  test('parse status', () {
    expect(WledStatus.fromXml(xml), {
      WledStatus(
        brightness: 10,
      )
    });
  });
}
