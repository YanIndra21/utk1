import 'dart:developer';

import 'package:flutter/material.dart';
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
        leading: GestureDetector(
          onTap: () {
            setState(() {
              widget._editingController.add.clear(); 
              widget._editingController.add2.clear();
            });
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              widget._editingController.dummyAddData();
              setState(() {
                log(widget._editingController.add.value.text.toString());
                widget._editingController.add.clear();
              });
              widget._editingController.add.clear();
              widget._editingController.add2.clear();
              Get.back();
            },
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  'Simpan',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'BrandonText'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            maxLines: 1,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Judul',
            ),
            controller: widget._editingController.add,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: widget._editingController.add2,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Mulai Mengetik'),
            ),
          ),
        ],
      ),
    );
  }
}
