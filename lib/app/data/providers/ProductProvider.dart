import 'dart:io';
import 'package:dio/dio.dart';
import 'package:Pawonkoe/app/data/models/api.dart';
import 'package:Pawonkoe/app/data/providers/TokenHelper.dart';

class ProductProvider {
  final Dio dio = Dio();

  ProductProvider() {
    dio.options.baseUrl = AppApi.BASEURL;
    dio.options.connectTimeout = Duration(seconds: 30); // 30 seconds
  }

  Future<Response> getListProduct() async {
    try {
      final response = await dio.get(
        '${AppApi.product}',
        options: _getRequestOptions(),
      );
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Response> getProductById(int id) async {
    try {
      final response = await dio.get(
        '${AppApi.product}/$id',
        options: _getRequestOptions(),
      );
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Response> postProduct(
      List<String> listImage, List<String> varian, Map data) async {
    try {
      final form = FormData();
      data.forEach((key, value) {
        form.fields.add(MapEntry(key, value.toString()));
      });
      for (var path in listImage) {
        form.files.add(MapEntry(
          'image[]',
          await MultipartFile.fromFile(path, filename: path.split('/').last),
        ));
      }
      for (var v in varian) {
        form.fields.add(MapEntry('varian[]', v));
      }

      final response = await dio.post(
        '${AppApi.product}',
        data: form,
        options: _getRequestOptions(
            contentType: 'multipart/form-data; boundary=${form.boundary}'),
      );

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Response> editProduct(int productId, List<String> listImage,
      List<String> varian, Map data) async {
    try {
      final form = FormData();
      data.forEach((key, value) {
        form.fields.add(MapEntry(key, value.toString()));
      });
      for (var path in listImage) {
        form.files.add(MapEntry(
          'image[]',
          await MultipartFile.fromFile(path, filename: path.split('/').last),
        ));
      }
      for (var v in varian) {
        form.fields.add(MapEntry('varian[]', v));
      }

      final response = await dio.post(
        '${AppApi.product}/$productId',
        data: form,
        options: _getRequestOptions(
            contentType: 'multipart/form-data; boundary=${form.boundary}'),
      );

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Response> deleteProduct(int id) async {
    try {
      final response = await dio.delete(
        '${AppApi.product}/$id',
        options: _getRequestOptions(),
      );
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Options _getRequestOptions({String contentType = 'application/json'}) {
    return Options(
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${TokenHelper.token}',
        'Content-Type': contentType,
      },
    );
  }
}
