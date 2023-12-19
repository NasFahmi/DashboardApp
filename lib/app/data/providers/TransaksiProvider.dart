import 'package:get/get_connect/connect.dart';
import 'package:pawonkoe/app/data/models/api.dart';

class TransaksiProvider extends GetConnect {
  Future<Response> getListTransaksi() => get(
        '${AppApi.BASEURL + AppApi.transaksi}',
        headers: {'Accept': 'application/json'},
      );
  Future<Response> getDataChart(int id) => get(
        '${AppApi.BASEURL + AppApi.chartTransaksi}',
        headers: {'Accept': 'application/json'},
      );
}
