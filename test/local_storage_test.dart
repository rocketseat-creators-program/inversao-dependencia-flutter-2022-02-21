import 'package:flutter_test/flutter_test.dart';
import 'package:reverse_dependence/core/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';

class SharedPreferencesMock extends Mock implements SharedPreferences {}

void main() {
  late ILocalStorage localStorage;
  late SharedPreferencesMock preferencesMock;

  setUp(() {
    preferencesMock = SharedPreferencesMock();
    localStorage = LocalStorage(preferences: preferencesMock);
  });

  test('should test get String', () {
    when(preferencesMock.getString('title')).thenReturn('Titulo do App');

    final title = localStorage.getString(key: 'title');

    expect(title, 'Titulo do App');
  });

  test('should test get bool', () {
    when(preferencesMock.getBool('userLogged')).thenReturn(true);

    final userLogged = localStorage.getBool(key: 'userLogged');

    expect(userLogged, true);
  });
}
