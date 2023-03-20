class Model {
  String? name;
  String? mob;
  List<String>? tra;
  List<String>? download;

  Model({this.name, this.mob, this.tra, this.download});

  Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mob = json['mob'];
    tra = json['tra'].cast<String>();
    download = json['download'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['mob'] = mob;
    data['tra'] = tra;
    data['download'] = download;
    return data;
  }
}
