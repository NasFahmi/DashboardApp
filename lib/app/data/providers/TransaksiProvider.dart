import 'package:get/get_connect/connect.dart';
import 'package:pawonkoe/app/data/models/api.dart';
import 'package:pawonkoe/app/data/providers/TokenHelper.dart';

class TransaksiProvider extends GetConnect {
  Future<Response> getListTransaksi() => get(
        '${AppApi.BASEURL + AppApi.transaksi}',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${TokenHelper.token}',
        },
      );
  Future<Response> getDataChart() => get(
        '${AppApi.BASEURL + AppApi.chartTransaksi}',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${TokenHelper.token}',
        },
      );
}
