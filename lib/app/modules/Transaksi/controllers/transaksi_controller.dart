import 'package:get/get.dart';
import 'package:Pawonkoe/app/data/models/ChartModel.dart';
import 'package:Pawonkoe/app/data/models/TransaksiModel.dart';
import 'package:Pawonkoe/app/data/providers/TransaksiProvider.dart';

class TransaksiController extends GetxController {
  TransaksiProvider transaksiProvider = TransaksiProvider();
  Rx<ListTransaksi> transaksiInformation = ListTransaksi().obs;
  Rx<ChartDataTransaksi> chartTransaksiInformation = ChartDataTransaksi().obs;
  RxList Bulan = [].obs;

  @override
  void onInit() {
    print('onInit transaksi');
    super.onInit();
    getDataTransaksi();
    getDataChartTransaksi();
  }

  @override
  void onReady() {
    print('onReady transaksi');
    super.onReady();
    print(Bulan);
  }

  @override
  void onClose() {
    print('onClose Transaksi');
    super.onClose();
  }

  Future<void> getDataTransaksi() async {
    try {
      final response = await transaksiProvider.getListTransaksi();
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.body;
        transaksiInformation.value = ListTransaksi.fromJson(responseData);

        // print(response.body);
        // print(transaksiInformation.value.data?[0].products?.namaProduct);
        print(transaksiInformation.value.data?[0].products?.fotos?[0].url);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      Future e;
    }
  }

  Future<void> getDataChartTransaksi() async {
    try {
      final response = await transaksiProvider.getDataChart();
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.body;
        chartTransaksiInformation.value =
            ChartDataTransaksi.fromJson(responseData);
        var dataPenjualan =
            chartTransaksiInformation.value?.data!.dataPenjualan;
        Bulan.value.addAll(responseData['data']['data_penjualan'].keys);
        print(response.body);
        print(chartTransaksiInformation.value.data?.dataPenjualan?[0]);
        print(Bulan);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      Future e;
    }
  }
}
