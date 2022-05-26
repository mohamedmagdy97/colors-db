import 'package:test/test.dart';

void main() {
  /// First Text Form Field

  test('value is empty ', () {
    var string = 'M Magdy';

    expect(string.trim().isEmpty, equals(false));
  });

  test('value start with a', () {
    var string = 'meg';
    expect(string.trim().toLowerCase().startsWith('a'), equals(false));
  });

  test('value between 5 and 9', () {
    var string = 'mohamed';
    expect(
        (string.trim().length > 5 && string.trim().length < 9), equals(true));
  });
}
