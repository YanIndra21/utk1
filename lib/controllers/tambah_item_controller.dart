import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:utk/models/tambah_model.dart';
import 'package:utk/models/tambah_model_list.dart';

class TambahItemController extends GetxController {
  TambahModel tambahModel = TambahModel();
    TextEditingController edit = TextEditingController();
  TextEditingController edit2 = TextEditingController();

  TextEditingController add = TextEditingController();
  TextEditingController add2 = TextEditingController();
  var listModel = <TambahModel>[];
  var newList = <TambahModel>[];

  void dummyAddData() {
    var data = TambahModel(
        name: add.value.text.toString(), desk: add2.value.text.toString());

    listModel.add(data);
    update();
  }

  List<TambahModel> findData(String search) {
    listModel = newList;
    return newList
        .where((element) =>
            element.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
