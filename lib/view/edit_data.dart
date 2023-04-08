import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utk/controllers/edit_item_controller.dart';
import 'package:utk/controllers/tambah_item_controller.dart';

class EditData extends StatefulWidget {
  EditData({super.key});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final _editingController = Get.put(TambahItemController());
  String name = Get.arguments['name'];
  String desk = Get.arguments['desk'];

  @override
  Widget build(BuildContext context) {
    TextEditingController _desk = TextEditingController(text: desk);
    TextEditingController _name = TextEditingController(text: name);
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () => Get.back(),
            child: const Center(
                child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'Simpan',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'BrandonText',
                    fontSize: 16),
              ),
            )),
          )
        ],
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(171, 229, 188, 1),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _name,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            controller: _desk,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
