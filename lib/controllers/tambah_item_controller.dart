
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:utk/models/tambah_model.dart';

class TambahItemController extends GetxController {
  TambahModel tambahModel = TambahModel();
  TextEditingController edit = TextEditingController();
  TextEditingController edit2 = TextEditingController();

  TextEditingController add = TextEditingController();
  TextEditingController add2 = TextEditingController();
  var listModel = <TambahModel>[];
  // var newList = <TambahModel>[];

  void dummyAddData() {
    var data = TambahModel(
        name: add.value.text.toString(), desk: add2.value.text.toString());

    if (add.value.text.isNotEmpty && add2.value.text.isNotEmpty ||add.value.text.isNotEmpty||add2.value.text.isNotEmpty) {
      listModel.add(data);
      update();
    }
  }

  List<TambahModel> findData(String search) {
    listModel = listModel;
    return listModel
        .where((element) =>
            element.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
