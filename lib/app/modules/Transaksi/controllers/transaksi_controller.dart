import 'package:get/get.dart';
import 'package:pawonkoe/app/data/models/ChartModel.dart';
import 'package:pawonkoe/app/data/models/TransaksiModel.dart';
import 'package:pawonkoe/app/data/providers/TransaksiProvider.dart';

class TransaksiController extends GetxController {
  TransaksiProvider transaksiProvider = TransaksiProvider();
  Rx<ListTransaksi> transaksiInformation = ListTransaksi().obs;
  Rx<ChartTransaksi> chartTransaksiInformation = ChartTransaksi().obs;
  List sumValues = [].obs;
  List allDataDates = [].obs;

  @override
  void onInit() {
    print('onInit transaksi');
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady transaksi');
    super.onReady();
    getDataTransaksi();
    getDataChartTransaksi();
    getSumValue();
    getAllDataDates();
    print(sumValues);
    print(allDataDates);
  }

  @override
  void onClose() {
    print('onClose Transaksi');
    super.onClose();
  }

  void getSumValue() {
    if (chartTransaksiInformation.value.data?.dataPenjualan != null &&
        sumValues.isEmpty) {
      for (var entry in chartTransaksiInformation.value.data!.dataPenjualan!) {
        sumValues.add(entry.sum);
      }
    }
    // Print or use the sumValues variable as needed
    // print('Sum Values: $sumValues');
  }

  void getAllDataDates() {
    if (chartTransaksiInformation.value.data?.dataPenjualan != null) {
      for (var entry in chartTransaksiInformation.value.data!.dataPenjualan!) {
        allDataDates.add(entry.dates);
      }
    }
  }

  Future<void> getDataTransaksi() async {
    try {
      final response = await transaksiProvider.getListTransaksi();
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.body;
        transaksiInformation.value = ListTransaksi.fromJson(responseData);
        print(response.body);
        print(transaksiInformation.value.data?[0].products?.namaProduct);
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
        chartTransaksiInformation.value = ChartTransaksi.fromJson(responseData);
        print(response.body);
        print(chartTransaksiInformation.value.data?.dataPenjualan?[0].sum);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      Future e;
    }
  }
}
