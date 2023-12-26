import 'dart:io';
import 'dart:math';

import 'package:get/get_connect/connect.dart';
import 'package:pawonkoe/app/data/models/api.dart';

class ProductProvider extends GetConnect {
  Future<Response> getListProduct() => get(
        '${AppApi.BASEURL + AppApi.product}',
        headers: {'Accept': 'application/json'},
      );
  Future<Response> getProductById(int id) => get(
        '${AppApi.BASEURL + AppApi.product}/${id}',
        headers: {'Accept': 'application/json'},
      );
  Future<Response> postProduct(
      List<String> listImage, List<String> varian, Map data) {
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
      for (var v in varian) {
        form.fields.add(MapEntry(
          'varian[]',
          v, // Add the variant value to the form field
        ));
      }

      return post(
        AppApi.BASEURL + AppApi.product,
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

  Future<Response> deleteProduct(int id) => delete(
        '${AppApi.BASEURL + AppApi.product}/${id}',
        headers: {'Accept': 'application/json'},
      );
}
