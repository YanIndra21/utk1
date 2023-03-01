import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:utk/controllers/tambah_item_controller.dart';

class TambahItem extends StatefulWidget {
  final _editingController = Get.find<TambahItemController>();
  TambahItem({super.key});

  @override
  State<TambahItem> createState() => _TambahItemState();
}

class _TambahItemState extends State<TambahItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Text('Tambah Item'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: widget._editingController.add,
          ),
          TextFormField(
            controller: widget._editingController.add2,
          ),
          GestureDetector(
            onTap: () {
              widget._editingController.dummyAddData();
              setState(() {
                log(widget._editingController.add.value.text.toString());
                widget._editingController.add.clear();
              });
              Get.back();
            },
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
