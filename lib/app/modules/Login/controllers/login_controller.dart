import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawonkoe/app/components/_SnackBarLoginError.dart';
import 'package:pawonkoe/app/data/providers/AuthProvider.dart';
import 'package:pawonkoe/app/data/models/AuthModel.dart';
import 'package:pawonkoe/app/data/providers/TokenHelper.dart';
import 'package:pawonkoe/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/api.dart';

class LoginController extends GetxController {
  var isObscure = true.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthProvider auth = AuthProvider();
  AuthLogin loginInformation = AuthLogin();
  var loading = false.obs;
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // final SharedPreferences prefs = await _prefs;

  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  void toogleEye() {
    isObscure.toggle();
  }

  void printTextEdit() {
    print(usernameController.text);
    print(passwordController.text);
  }

  void onInit() {
    // print('token = ${TokenHelper.token}');
    TokenHelper.getToken().then((String? token) {
      if (token != null) {
        print(token);
        TokenHelper.addToken(token);
        Get.offAndToNamed(Routes.HOME);
      }
    });
    super.onInit();
  }

  Future<void> authLogin() async {
    print('login prosess');
    Map<String, dynamic> user = {
      'username': usernameController.text,
      'password': passwordController.text,
    };
    try {
      loading.toggle();
      print('authing login');
      print('${AppApi.BASEURL + AppApi.loginUrl}');
      final response = await auth.authLogin(user).timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.body;
        loginInformation = AuthLogin.fromJson(responseData); //success
        TokenHelper.addToken(loginInformation.data!.token!);
        // addToken();
        // debugPrint(TokenHelper.token);

        // debugPrint(TokenHelper.);
        // print(responseData);
        debugPrint(loginInformation.data?.token); //! can access token
        loading.toggle();
        if (loginInformation.success == true) {
          Get.offAllNamed(Routes.HOME);
        }
      } else if (response.statusCode == 400) {
        loading.toggle();
        Get.showSnackbar(snackBarLoginErrors());
      }
    } on TimeoutException {
      // Handle timeout
      loading.toggle();
      Get.showSnackbar(snackBarTimeOut());
    } catch (e) {
      // print('error');
      return Future.error(e);
    }
  }
}
