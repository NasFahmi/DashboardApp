class Product {
  bool? success;
  List<Data>? data;

  Product({this.success, this.data});

  Product.fromJson(Map<String, dynamic> json) {
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
  String? hargaRendah;
  String? hargaTinggi;
  String? deskripsi;
  String? linkShopee;
  String? stok;
  String? spesifikasiProduct;
  List<Fotos>? fotos;
  List<Varians>? varians;
  List<BeratJenis>? beratJenis;

  Data(
      {this.id,
      this.namaProduct,
      this.hargaRendah,
      this.hargaTinggi,
      this.deskripsi,
      this.linkShopee,
      this.stok,
      this.spesifikasiProduct,
      this.fotos,
      this.varians,
      this.beratJenis});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaProduct = json['nama_product'];
    hargaRendah = json['harga_rendah'];
    hargaTinggi = json['harga_tinggi'];
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
    if (json['berat_jenis'] != null) {
      beratJenis = <BeratJenis>[];
      json['berat_jenis'].forEach((v) {
        beratJenis!.add(new BeratJenis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_product'] = this.namaProduct;
    data['harga_rendah'] = this.hargaRendah;
    data['harga_tinggi'] = this.hargaTinggi;
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
    if (this.beratJenis != null) {
      data['berat_jenis'] = this.beratJenis!.map((v) => v.toJson()).toList();
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
    url = json['url'];
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

class BeratJenis {
  int? id;
  String? beratJenis;

  BeratJenis({this.id, this.beratJenis});

  BeratJenis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    beratJenis = json['berat_jenis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['berat_jenis'] = this.beratJenis;
    return data;
  }
}
