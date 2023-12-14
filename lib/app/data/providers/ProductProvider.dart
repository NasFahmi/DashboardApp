import 'package:get/get.dart';
import 'package:pawonkoe/app/data/models/api.dart';

class ProductProvider extends GetConnect {
  Future<Response> getListProduct() => get(
        '${AppApi.BASEURL + AppApi.indexProduct}',
        headers: {'Accept': 'application/json'},
      );
}
