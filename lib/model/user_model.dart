class User {
  String? sId;
  String? name;
  String? email;
  bool? disabled;
  bool? verified;
  int? role;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? otp;

  User(
      {this.sId,
      this.name,
      this.email,
      this.disabled,
      this.verified,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.otp});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    disabled = json['disabled'];
    verified = json['verified'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['disabled'] = this.disabled;
    data['verified'] = this.verified;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['otp'] = this.otp;
    return data;
  }
}
