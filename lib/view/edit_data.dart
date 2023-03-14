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

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController(text: name);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(171, 229, 188, 1),
        title: Text(
          'Edit',
          style: TextStyle(fontFamily: 'BrandonText'),
        ),
      ),
      body: Column(
        children: [
          TextFormField(controller: _name),
          TextFormField(
            controller: _editingController.edit2,
          ),
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.red,
              ),
              margin: const EdgeInsets.fromLTRB(16, 10, 16, 25),
              height: 48,
              width: 343,
              child: const Center(
                child: Text(
                  'Simpan',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
