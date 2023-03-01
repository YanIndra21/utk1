import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utk/controllers/tambah_item_controller.dart';
import 'package:utk/view/edit_data.dart';
import 'package:utk/view/profil.dart';
import 'package:utk/view/search_page.dart';
import 'package:utk/view/tambah_item.dart';

class Homepage extends StatefulWidget {
  final _tambahItem = Get.put(TambahItemController());
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController add = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        // leading: Icon(Icons.dehaze),
        elevation: 0,
        title: GestureDetector(
          onTap: () => Get.to(SearchPage()),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            width: 311,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'hemmmm',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(ProfilMenu()),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: GetBuilder<TambahItemController>(builder: (context) {
          return ListView.builder(
              itemBuilder: (context, index) => addItem(index: index),
              itemCount: widget._tambahItem.listModel.length);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TambahItem());
        },
        elevation: 0,
        child: Icon(Icons.post_add),
      ),
    );
  }

  Widget addItem({required int index}) {
    return GestureDetector(
      onTap: () => Get.to(EditData()),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Container(
                    //   width: 102,
                    //   height: 124,
                    //   color: Colors.grey,
                    //   child: Image.asset('assets/ashley2.png'),
                    // ),
                    Text(widget._tambahItem.listModel[index].name!),
                  ],
                ),
                Icon(Icons.delete)
              ],
            ),
            Text(widget._tambahItem.listModel[index].desk!)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    widget._tambahItem.dummyAddData();
    // TODO: implement initState
    super.initState();
  }
}
