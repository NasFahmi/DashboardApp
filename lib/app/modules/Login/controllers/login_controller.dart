import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawonkoe/app/data/providers/AuthProvider.dart';
import 'package:pawonkoe/app/data/models/AuthModel.dart';
import 'package:pawonkoe/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var isObscure = true.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthProvider auth = AuthProvider();
  AuthLogin loginInformation = AuthLogin();

  void toogleEye() {
    isObscure.toggle();
  }

  void printTextEdit() {
    print(usernameController.text);
    print(passwordController.text);
  }

  Future<void> authLogin() async {
    Map<String, dynamic> user = {
      'username': usernameController.text,
      'password': passwordController.text,
    };
    try {
      final response = await auth.authLogin(user);
      final responseTest = await auth.postTest(user);

      print(responseTest.statusCode); //! status code 201 work

      // print('url ${response.request?.url}'); //! null
      // print('Response Status Code: ${response.statusCode}'); //! null
      // print('Response Body: ${response.body}'); //!null

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.body;
        loginInformation = AuthLogin.fromJson(responseData);
        print(loginInformation.data?.token); //! can access token
        login();
      } else {
        print('Login failed: ${response.statusCode}'); //!null
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  void login() {
    if (loginInformation.success == true) {
      Get.toNamed(Routes.DASHBOARD);
    }
  }
}
