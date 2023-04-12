import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Longpress extends StatefulWidget {
  const Longpress({super.key});

  @override
  State<Longpress> createState() => _LongpressState();
}

class _LongpressState extends State<Longpress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onLongPress: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(0, 1000, 0, 0),
                items: [
                  PopupMenuItem(
                    child: Text("Cut"),
                    onTap: () {
                      // Tambahkan kode untuk memotong teks yang dipilih
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Copy"),
                    onTap: () {
                      // Tambahkan kode untuk menyalin teks yang dipilih
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Delete"),
                    onTap: () {
                      // Tambahkan kode untuk menghapus teks yang dipilih
                    },
                  ),
                ],
              );
            },
            child: Container(
              width: Get.width,
              height: 50,
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SelectableText("Ini adalah contoh teks"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
