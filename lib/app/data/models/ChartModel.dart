class ChartDataTransaksi {
  bool? success;
  Data? data;

  ChartDataTransaksi({this.success, this.data});

  ChartDataTransaksi.fromJson(Map<String, dynamic> json) {
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
  List<String>? dataPenjualan;
  List<String>? bulan;
  String? startDate;
  String? endDay;
  int? tahun;

  Data(
      {this.dataPenjualan,
      this.bulan,
      this.startDate,
      this.endDay,
      this.tahun});

  Data.fromJson(Map<String, dynamic> json) {
    dataPenjualan = json['data_penjualan'].cast<String>();
    bulan = json['bulan'].cast<String>();
    startDate = json['start_date'];
    endDay = json['endDay'];
    tahun = json['tahun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_penjualan'] = this.dataPenjualan;
    data['bulan'] = this.bulan;
    data['start_date'] = this.startDate;
    data['endDay'] = this.endDay;
    data['tahun'] = this.tahun;
    return data;
  }
}
