import 'package:pawonkoe/app/data/models/api.dart';

class ListTransaksi {
  bool? success;
  List<Data>? data;

  ListTransaksi({this.success, this.data});

  ListTransaksi.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? tanggal;
  int? jumlah;
  int? isComplete;
  Products? products;

  Data({this.id, this.tanggal, this.jumlah, this.isComplete, this.products});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tanggal = json['tanggal'];
    jumlah = json['jumlah'];
    isComplete = json['is_complete'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tanggal'] = this.tanggal;
    data['jumlah'] = this.jumlah;
    data['is_complete'] = this.isComplete;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  String? namaProduct;
  String? harga;
  String? deskripsi;
  String? linkShopee;
  String? stok;
  String? spesifikasiProduct;
  List<Fotos>? fotos;

  Products(
      {this.id,
      this.namaProduct,
      this.harga,
      this.deskripsi,
      this.linkShopee,
      this.stok,
      this.spesifikasiProduct,
      this.fotos});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaProduct = json['nama_product'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    linkShopee = json['link_shopee'];
    stok = json['stok'];
    spesifikasiProduct = json['spesifikasi_product'];
    if (json['fotos'] != null) {
      fotos = <Fotos>[];
      json['fotos'].forEach((v) {
        fotos!.add(new Fotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_product'] = this.namaProduct;
    data['harga'] = this.harga;
    data['deskripsi'] = this.deskripsi;
    data['link_shopee'] = this.linkShopee;
    data['stok'] = this.stok;
    data['spesifikasi_product'] = this.spesifikasiProduct;
    if (this.fotos != null) {
      data['fotos'] = this.fotos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fotos {
  int? id;
  String? url;

  Fotos({this.id, this.url});

  Fotos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'] != null ? '${AppApi.PATHIMAGE}/${json['url']}' : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
