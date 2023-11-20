import 'package:get/get.dart';
import './../models/api.dart';

class AuthProvider extends GetConnect {
  Future<Response> authLogin(Map data) =>
      post('${AppApi.BASEURL}${AppApi.loginUrl}', data);

  Future<Response> postLogin(Map data) =>
      post('http://localhost:8000/api/login', data);

  // !test post
  Future<Response> postTest(Map data) =>
      post('https://jsonplaceholder.typicode.com/posts', data);
}
