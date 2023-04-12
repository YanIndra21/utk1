import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utk/controllers/db_helper.dart';
import 'package:utk/controllers/tambah_item_controller.dart';
import 'package:utk/models/tambah_model.dart';
import 'package:utk/view/edit_data.dart';
import 'package:utk/view/tambah_item.dart';
import 'package:flutter/gestures.dart';

class Homepage extends StatefulWidget {
  final _tambahItem = Get.put(TambahItemController());
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> _allData = [];
  bool _isLoading = true;

// GET ALL DATA
  void refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initstate() {
    super.initState();
    refreshData();
  }

  final longPress = LongPressGestureRecognizer();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

// CREATE DATA
  Future<void> _addData() async {
    await SQLHelper.createData(_nameController.text, _descController.text);
  }

// UPDATE DATA
  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(id, _nameController.text, _descController.text);
  }

// DELETE DATA
  Future<void> _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        'Catatan Dihapus',
      ),
    ));
  }

  String searchBar = '';
  // TextEditingController add = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Color.fromRGBO(30, 30, 30, 1)),
        ),
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(171, 229, 188, 1),
        // leading: Icon(Icons.dehaze),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Apa Yang Ingin Kamu Catat?',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'BrandonText',
                  fontWeight: FontWeight.bold),
            )
          ],
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromRGBO(30, 30, 30, 1),
                  ),
                  color: Colors.white),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Temukan Catatan',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search)),
                // controller: add,
                onChanged: (value) {
                  setState(() {
                    widget._tambahItem.findData(searchBar = value);
                  });
                },
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: GetBuilder<TambahItemController>(builder: (context) {
          if (widget._tambahItem.listModel.isNotEmpty) {
            if (searchBar.isEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => addItem(index: index),
                  itemCount: widget._tambahItem.listModel.length);
            } else {
              List<TambahModel> search = widget._tambahItem.findData(searchBar);
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => addItem2(index: index),
                  itemCount: search.length);
            }
          } else {
            return ListView(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 150),
                        child: Icon(
                          Icons.sticky_note_2_outlined,
                          size: 100,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'Tidak ada catatan',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(30, 30, 30, 1),
                            fontFamily: 'BrandonText'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: const BorderSide(
                                color: Color.fromRGBO(30, 30, 30, 1),
                              ),
                            ),
                            elevation: 0,
                            backgroundColor:
                                const Color.fromRGBO(207, 173, 232, 1)),
                        onPressed: () {
                          Get.to(TambahItem());
                        },
                        child: const Text(
                          'Tambahkan catatan',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(30, 30, 30, 1),
                              fontFamily: 'BrandonText'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        disabledElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: Color.fromRGBO(30, 30, 30, 1),
          ),
        ),
        backgroundColor: const Color.fromRGBO(207, 173, 232, 1),
        onPressed: () {
          Get.to(TambahItem());
        },
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget addItem({required int index}) {
    return GestureDetector(
      onLongPress: () {
        showMenu(
            context: context,
            position: RelativeRect.fromLTRB(0, 1000, 0, 0),
            items: [
              PopupMenuItem(
                child: Text("Delete"),
                onTap: () {
                  setState(() {
                    widget._tambahItem.listModel.removeAt(index);
                  });
                },
              ),
            ]);
      },
      onTap: () => Get.to(
        EditData(),
        arguments: {
          "name": widget._tambahItem.listModel[index].name,
          "desk": widget._tambahItem.listModel[index].desk
        },
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color.fromRGBO(30, 30, 30, 1)),
            color: const Color.fromRGBO(255, 215, 135, 1),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(widget._tambahItem.findData(searchBar)[index].name!),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  widget._tambahItem.findData(searchBar)[index].desk!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 99, 99, 99)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget addItem2({required int index}) {
    return GestureDetector(
      onTap: () => Get.to(EditData()),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color.fromRGBO(30, 30, 30, 1),
            ),
            color: const Color.fromRGBO(255, 215, 135, 1),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget._tambahItem.findData(searchBar)[index].name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  const Icon(Icons.delete)
                ],
              ),
              Text(
                widget._tambahItem.findData(searchBar)[index].desk!,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    widget._tambahItem.dummyAddData();

    super.initState();
  }
}
