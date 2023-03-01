// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:utk/models/tambah_model.dart';

class TambahModelReturn {
  List<TambahModel>? tambahmodelreturn;
  TambahModelReturn({
    this.tambahmodelreturn,
  });

  TambahModelReturn copyWith({
    List<TambahModel>? tambahmodelreturn,
  }) {
    return TambahModelReturn(
      tambahmodelreturn: tambahmodelreturn ?? this.tambahmodelreturn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tambahmodelreturn': tambahmodelreturn?.map((x) => x.toMap()).toList(),
    };
  }

  factory TambahModelReturn.fromMap(Map<String, dynamic> map) {
    return TambahModelReturn(
      tambahmodelreturn: map['tambahmodelreturn'] != null ? List<TambahModel>.from((map['tambahmodelreturn'] as List<int>).map<TambahModel?>((x) => TambahModel.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TambahModelReturn.fromJson(String source) => TambahModelReturn.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TambahModelReturn(tambahmodelreturn: $tambahmodelreturn)';

  @override
  bool operator ==(covariant TambahModelReturn other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.tambahmodelreturn, tambahmodelreturn);
  }

  @override
  int get hashCode => tambahmodelreturn.hashCode;
}
