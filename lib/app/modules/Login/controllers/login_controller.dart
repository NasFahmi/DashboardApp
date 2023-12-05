import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawonkoe/app/components/_SnackBarLoginError.dart';
import 'package:pawonkoe/app/data/providers/AuthProvider.dart';
import 'package:pawonkoe/app/data/models/AuthModel.dart';
import 'package:pawonkoe/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isObscure = true.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthProvider auth = AuthProvider();
  AuthLogin loginInformation = AuthLogin();
  var loading = false.obs;
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // final SharedPreferences prefs = await _prefs;
  final formKey = GlobalKey<FormState>();

  void toogleEye() {
    isObscure.toggle();
  }

  void printTextEdit() {
    print(usernameController.text);
    print(passwordController.text);
  }

  addToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', loginInformation.data!.token!);
  }

  Future<void> authLogin() async {
    Map<String, dynamic> user = {
      'username': usernameController.text,
      'password': passwordController.text,
    };
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.showSnackbar(snackBarLoginErrorsEmpty());
    }
    try {
      loading.toggle();
      final response = await auth.authLogin(user);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.body;
        loginInformation = AuthLogin.fromJson(responseData); //success
        // addToken();
        // print(responseData);
        debugPrint(loginInformation.data?.token); //! can access token
        loading.toggle();
        if (loginInformation.success == true) {
          Get.offNamed(Routes.DASHBOARD);
        }
      } else if (response.statusCode == 400) {
        loading.toggle();
        Get.showSnackbar(snackBarLoginErrors());
      }
    } catch (e) {
      // print('error');
      return Future.error(e);
    }
  }
}
