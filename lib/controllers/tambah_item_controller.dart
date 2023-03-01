import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:utk/models/tambah_model.dart';
import 'package:utk/models/tambah_model_list.dart';

class TambahItemController extends GetxController {
  TambahModel tambahModel = TambahModel();
  TextEditingController add = TextEditingController();
  TextEditingController add2 = TextEditingController();
  var listModel = <TambahModel>[];

  void dummyAddData() {
    var data = TambahModel(
        name: add.value.text.toString(), desk: add2.value.text.toString());

    listModel.add(data);
    update();
  }
}
