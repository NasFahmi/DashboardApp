import 'package:flutter_test/flutter_test.dart';
import 'package:pawonkoe/app/data/models/AuthModel.dart';
import 'package:pawonkoe/app/data/providers/AuthProvider.dart';
import 'package:pawonkoe/app/data/models/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('url is correct', () async {
    expect('${AppApi.BASEURL}' '${AppApi.loginUrl}',
        'http://localhost:8000/api/login');
    print('${AppApi.BASEURL}' '${AppApi.loginUrl}');
  });
  test("Login Success has token", () async {
    final AuthProvider auth = AuthProvider();
    Map<String, dynamic> user = {
      'username': "admin",
      'password': 'admin',
    };
    final data = await auth.authLogin(user);
    expect(data.body, isNotNull);
    print(data.body);
  });
  test("Login Fail Required Field", () async {
    final AuthProvider auth = AuthProvider();
    Map<String, dynamic> user = {
      'username': "",
      'password': "",
    };
    final data = await auth.authLogin(user);
    expect(data, isNotNull);
    // expect(data, isMap);
    print(data.body);
    // final Map<String, dynamic> datatest = json.decode(data.body);

    expect(data.body.containsKey('errors'), isTrue);

    // Memeriksa apakah hasilnya memiliki kunci "errors"
  });
  test("Login Fail username or password wrong", () async {
    final AuthProvider auth = AuthProvider();
    Map<String, dynamic> user = {
      'username': "admin1234",
      'password': 'admin1234',
    };
    final data = await auth.authLogin(user);
    expect(data, isNotNull);
    // expect(data, isMap);
    print(data.body);
    // final Map<String, dynamic> datatest = json.decode(data.body);

    expect(data.body.containsKey('errors'), isTrue);
  });
  test("Login Success convert token to model and access that token", () async {
    final AuthProvider auth = AuthProvider();
    Map<String, dynamic> user = {
      'username': "admin",
      'password': 'admin',
    };
    final data = await auth.authLogin(user);
    expect(data, isNotNull);
    AuthLogin loginInformation = AuthLogin.fromJson(data.body);
    print(loginInformation.data?.token);
  });
  test("Login Succes and Save Token to Shared Preferences", () async {
    final AuthProvider auth = AuthProvider();
    Map<String, dynamic> user = {
      'username': "admin",
      'password': 'admin',
    };
    final data = await auth.authLogin(user);
    AuthLogin loginInformation = AuthLogin.fromJson(data.body);
    String? token = loginInformation.data?.token;
    addToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token!);
    }

    addToken();
    Future<String?> getToken() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    }

    expect(getToken(), isNotNull);
  });
  test("shared preferences has Token", () async {
    final AuthProvider auth = AuthProvider();
    Map<String, dynamic> user = {
      'username': "admin",
      'password': 'admin',
    };
    final data = await auth.authLogin(user);
    AuthLogin loginInformation = AuthLogin.fromJson(data.body);
    String? token = loginInformation.data?.token;
    addToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token!);
    }

    addToken();
    Future<String?> getToken() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    }

    expect(await getToken(), isNotEmpty);
  });
  test("Logout Succes", () async {
    Future<String?> getToken() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    }

    Future<String?> token = getToken();
    final AuthProvider auth = AuthProvider();
    final data = await auth.authLogout(token as String);
    print(data.body);
    // expect(data.body.containsKey('success'), true);
  });
}
