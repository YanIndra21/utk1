import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditData extends StatefulWidget {
  const EditData({super.key});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Center(
            child: Text(
              'Back',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        title: Text(
          'Edit',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
