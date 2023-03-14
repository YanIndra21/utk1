// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TambahModel {
  String? name;
  String? desk;
  bool? isSelected;
  TambahModel({
    this.name,
    this.desk,
    this.isSelected = false,
  });

  TambahModel copyWith({
    String? name,
    String? desk,
    bool? isSelected,
  }) {
    return TambahModel(
      name: name ?? this.name,
      desk: desk ?? this.desk,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'desk': desk,
      'isSelected': isSelected,
    };
  }

  factory TambahModel.fromMap(Map<String, dynamic> map) {
    return TambahModel(
      name: map['name'] != null ? map['name'] as String : null,
      desk: map['desk'] != null ? map['desk'] as String : null,
      isSelected: map['isSelected'] != null ? map['isSelected'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TambahModel.fromJson(String source) =>
      TambahModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TambahModel(name: $name, desk: $desk, isSelected: $isSelected)';

  @override
  bool operator ==(covariant TambahModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.desk == desk &&
      other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ desk.hashCode ^ isSelected.hashCode;
}
