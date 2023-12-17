import 'package:pawonkoe/app/data/models/api.dart';

class Dashboard {
  bool? success;
  Data? data;

  Dashboard({this.success, this.data});

  Dashboard.fromJson(Map<String, dynamic> json) {
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
  Card? card;
  List<Product>? product;
  List<TopSalesProduct>? topSalesProduct;

  Data({this.card, this.product, this.topSalesProduct});

  Data.fromJson(Map<String, dynamic> json) {
    card = json['card'] != null ? new Card.fromJson(json['card']) : null;
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    if (json['top_sales_product'] != null) {
      topSalesProduct = <TopSalesProduct>[];
      json['top_sales_product'].forEach((v) {
        topSalesProduct!.add(new TopSalesProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['card'] = this.card!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    if (this.topSalesProduct != null) {
      data['top_sales_product'] =
          this.topSalesProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Card {
  int? totalOrder;
  String? totalPendapatan;
  String? totalProductTerjual;
  String? totalPreorder;

  Card(
      {this.totalOrder,
      this.totalPendapatan,
      this.totalProductTerjual,
      this.totalPreorder});

  Card.fromJson(Map<String, dynamic> json) {
    totalOrder = json['total_order'];
    totalPendapatan = json['total_pendapatan'];
    totalProductTerjual = json['total_product_terjual'];
    totalPreorder = json['total_preorder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_order'] = this.totalOrder;
    data['total_pendapatan'] = this.totalPendapatan;
    data['total_product_terjual'] = this.totalProductTerjual;
    data['total_preorder'] = this.totalPreorder;
    return data;
  }
}

class Product {
  int? id;
  String? namaProduct;
  String? harga;
  List<Fotos>? fotos;
  String? deskripsi;

  Product({this.id, this.namaProduct, this.harga, this.fotos, this.deskripsi});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaProduct = json['nama_product'];
    harga = json['harga'];
    if (json['fotos'] != null) {
      fotos = <Fotos>[];
      json['fotos'].forEach((v) {
        fotos!.add(new Fotos.fromJson(v));
      });
    }
    deskripsi = json['deskripsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_product'] = this.namaProduct;
    data['harga'] = this.harga;
    if (this.fotos != null) {
      data['fotos'] = this.fotos!.map((v) => v.toJson()).toList();
    }
    data['deskripsi'] = this.deskripsi;
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

class TopSalesProduct {
  String? namaProduct;
  String? terjual;

  TopSalesProduct({this.namaProduct, this.terjual});

  TopSalesProduct.fromJson(Map<String, dynamic> json) {
    namaProduct = json['nama_product'];
    terjual = json['terjual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_product'] = this.namaProduct;
    data['terjual'] = this.terjual;
    return data;
  }
}
