class GetAllCategoryModel {
  bool? success;
  String? message;
  List<DataCategory>? dataCategories;

  GetAllCategoryModel({this.success, this.message, this.dataCategories});

  GetAllCategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      dataCategories = <DataCategory>[];
      json['data'].forEach((v) {
        dataCategories!.add(new DataCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.dataCategories != null) {
      data['data'] = this.dataCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataCategory {
  String? sId;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  DataCategory(
      {this.sId,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  DataCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
