class AuthLogin {
  bool? success;
  Data? data;

  AuthLogin({this.success, this.data});

  AuthLogin.fromJson(Map<String, dynamic> json) {
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
  String? token;
  int? id;
  String? nama;
  String? email;
  String? linkToko;
  String? linkWa;
  String? linkIg;
  String? alamat;

  Data(
      {this.token,
      this.id,
      this.nama,
      this.email,
      this.linkToko,
      this.linkWa,
      this.linkIg,
      this.alamat});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
    linkToko = json['link_toko'];
    linkWa = json['link_wa'];
    linkIg = json['link_ig'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['link_toko'] = this.linkToko;
    data['link_wa'] = this.linkWa;
    data['link_ig'] = this.linkIg;
    data['alamat'] = this.alamat;
    return data;
  }
}
