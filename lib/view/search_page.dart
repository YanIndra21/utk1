import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController reset = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () => Get.back(),
        ),
        title: Text(
          'Pencarian',
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              height: 45,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade300),
              child: TextFormField(
                controller: reset,
                cursorColor: Colors.black,
                // enabled: false,
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  hintText: 'Mau makan apa hari ini?',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                    onTap: () {
                      reset.clear();
                    },
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pernah kamu cari',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              // height: 35,
                              // width: 110,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.grey.shade300),
                              child: Center(
                                child: Text(
                                  'Ayam Kremes',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                // height: 35,
                                // width: 110,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.grey.shade300),
                                child: Center(
                                  child: Text(
                                    'Ayam Kremes',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Kategori Pencarian',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 16),
                      //   child: Row(
                      //     children: [],
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
