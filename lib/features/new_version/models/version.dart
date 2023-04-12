class NewVersionModel {
  String? name;
  double? version;
  List<String>? description;
  String? fileName;

  NewVersionModel({this.name, this.version, this.description, this.fileName});

  NewVersionModel.fromJson(Map<String, dynamic> json) {
    name = "${json['name']}";
    version = double.tryParse(json['version'].toString());
    if (json['description'] is List) {
      final desc = json['description'] as List;
      description = desc.cast<String>();
    }
    fileName = "${json['file_name']}";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['version'] = version;
    data['description'] = description;
    data['file_name'] = fileName;
    return data;
  }
}
