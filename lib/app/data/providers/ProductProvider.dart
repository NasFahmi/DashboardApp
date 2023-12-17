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
}
