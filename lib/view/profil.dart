import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilMenu extends StatefulWidget {
  const ProfilMenu({super.key});

  @override
  State<ProfilMenu> createState() => _ProfilMenuState();
}

class _ProfilMenuState extends State<ProfilMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
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
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
