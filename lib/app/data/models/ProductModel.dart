import 'package:pawonkoe/app/data/models/api.dart';

class ListProduct {
  bool? success;
  List<Data>? data;

  ListProduct({this.success, this.data});

  ListProduct.fromJson(Map<String, dynamic> json) {
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
  String? namaProduct;
  String? harga;
  String? deskripsi;
  String? linkShopee;
  String? stok;
  String? spesifikasiProduct;
  List<Fotos>? fotos;
  List<Varians>? varians;

  Data(
      {this.id,
      this.namaProduct,
      this.harga,
      this.deskripsi,
      this.linkShopee,
      this.stok,
      this.spesifikasiProduct,
      this.fotos,
      this.varians});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['varians'] != null) {
      varians = <Varians>[];
      json['varians'].forEach((v) {
        varians!.add(new Varians.fromJson(v));
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
    if (this.varians != null) {
      data['varians'] = this.varians!.map((v) => v.toJson()).toList();
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

class Varians {
  int? id;
  String? jenisVarian;

  Varians({this.id, this.jenisVarian});

  Varians.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenisVarian = json['jenis_varian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jenis_varian'] = this.jenisVarian;
    return data;
  }
}
