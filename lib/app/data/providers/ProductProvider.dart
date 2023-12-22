import 'dart:io';
import 'dart:math';

import 'package:get/get_connect/connect.dart';
import 'package:pawonkoe/app/data/models/api.dart';

class ProductProvider extends GetConnect {
  Future<Response> getListProduct() => get(
        '${AppApi.BASEURL + AppApi.listproduct}',
        headers: {'Accept': 'application/json'},
      );
  Future<Response> getProductById(int id) => get(
        '${AppApi.BASEURL + AppApi.listproduct}/${id}',
        headers: {'Accept': 'application/json'},
      );
  Future<Response> postProduct(List<String> listImage, Map data) {
    try {
      final form = FormData({});
      data.forEach((key, value) {
        form.fields.add(MapEntry(key, value.toString()));
      });
      for (var path in listImage) {
        form.files.add(MapEntry(
          'image[]',
          MultipartFile(File(path), filename: path.split('/').last),
        ));
      }

      return post(
        'http://192.168.1.30:8000/api/product',
        form,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data; boundary=${form.boundary}',
        },
      );
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
