// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TambahModel {
  String? name;
  String? desk;
  TambahModel({
    this.name,
    this.desk,
  });

  TambahModel copyWith({
    String? name,
    String? desk,
  }) {
    return TambahModel(
      name: name ?? this.name,
      desk: desk ?? this.desk,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'desk': desk,
    };
  }

  factory TambahModel.fromMap(Map<String, dynamic> map) {
    return TambahModel(
      name: map['name'] != null ? map['name'] as String : null,
      desk: map['desk'] != null ? map['desk'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TambahModel.fromJson(String source) =>
      TambahModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TambahModel(name: $name, desk: $desk)';

  @override
  bool operator ==(covariant TambahModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.desk == desk;
  }

  @override
  int get hashCode => name.hashCode ^ desk.hashCode;
}
