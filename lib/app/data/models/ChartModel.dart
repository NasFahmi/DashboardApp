class ChartTransaksi {
  bool? success;
  Data? data;

  ChartTransaksi({this.success, this.data});

  ChartTransaksi.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<DataPenjualan>? dataPenjualan;
  String? startDate;
  String? endDay;

  Data({this.dataPenjualan, this.startDate, this.endDay});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data_penjualan'] != null) {
      dataPenjualan = <DataPenjualan>[];
      json['data_penjualan'].forEach((v) {
        dataPenjualan!.add(new DataPenjualan.fromJson(v));
      });
    }
    startDate = json['start_date'];
    endDay = json['endDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataPenjualan != null) {
      data['data_penjualan'] =
          this.dataPenjualan!.map((v) => v.toJson()).toList();
    }
    data['start_date'] = this.startDate;
    data['endDay'] = this.endDay;
    return data;
  }
}

class DataPenjualan {
  List<String>? dates;
  List<String>? values;
  int? sum;

  DataPenjualan({this.dates, this.values, this.sum});

  DataPenjualan.fromJson(Map<String, dynamic> json) {
    dates = json['dates'].cast<String>();
    values = json['values'].cast<String>();
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dates'] = this.dates;
    data['values'] = this.values;
    data['sum'] = this.sum;
    return data;
  }
}
