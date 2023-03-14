import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:utk/controllers/tambah_item_controller.dart';
import 'package:utk/models/tambah_model.dart';
import 'package:utk/view/edit_data.dart';
import 'package:utk/view/tambah_item.dart';

class Homepage extends StatefulWidget {
  final _tambahItem = Get.put(TambahItemController());
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String searchBar = '';
  TextEditingController add = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(171, 229, 188, 1),
        // leading: Icon(Icons.dehaze),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hi, Yanin!',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'BrandonText', fontSize: 16),
            ),
            Text(
              'Apa Yang Ingin Kamu Catat?',
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontFamily: 'BrandonText'),
            )
          ],
        ),
        // actions: [
        //   Row(
        //     children: [
        //       GestureDetector(
        //         onTap: () => Get.to(ProfilMenu()),
        //         child: Padding(
        //           padding: const EdgeInsets.only(right: 10),
        //           child: CircleAvatar(
        //             backgroundColor: Colors.white,
        //             child: Icon(
        //               Icons.person,
        //               color: Colors.black,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child:
            //  ListView(
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(bottom: 16),
            //           child: Text(
            //             'Rekomendasi',
            //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            //           ),
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               'Sedang Hangat',
            //               style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //             Icon(Icons.keyboard_double_arrow_right)
            //           ],
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 14),
            //           child: Container(
            //             padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            //             width: Get.width,
            //             height: 148,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(7),
            //             ),
            //             child: Stack(
            //               children: [
            //                 Row(
            //                   children: [
            //                     Container(
            //                       width: 94,
            //                       height: 124,
            //                       color: Colors.white,
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 10),
            //                       child: Column(
            //                         // crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           Center(
            //                             child: Text(
            //                               'Dreams',
            //                               style: TextStyle(
            //                                 fontWeight: FontWeight.bold,
            //                               ),
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Divider(
            //           color: Colors.grey.shade500,
            //           height: 1,
            //         ),
            GetBuilder<TambahItemController>(builder: (context) {
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
        }),
        //       ],
        //     ),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TambahItem());
        },
        elevation: 0,
        child: const Icon(Icons.post_add),
      ),
    );
  }

  Widget addItem({required int index}) {
    return GestureDetector(
      onTap: () => Get.to(EditData(),
          arguments: {"name": widget._tambahItem.listModel[index].name}),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color.fromRGBO(30, 30, 30, 1)),
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
                      // Container(
                      //   width: 102,
                      //   height: 124,
                      //   color: Colors.grey,
                      //   child: Image.asset('assets/ashley2.png'),
                      // ),
                      Text(widget._tambahItem.findData(searchBar)[index].name!),
                    ],
                  ),
                  GestureDetector(
                    child: const Icon(Icons.delete),
                    onTap: () {
                      showDialog(
                        useSafeArea: true,
                        context: context,
                        builder: ((context) {
                          return AlertDialog(
                            title: SvgPicture.asset(
                              'assets/Delete.svg',
                              height: 61,
                              width: 46,
                              color: const Color.fromRGBO(156, 156, 160, 1),
                              fit: BoxFit.fitHeight,
                            ),
                            content: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 90,
                                width: 335,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Hapus Item',
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Apa kamu yakin ingin menghapus data',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromRGBO(
                                                    156, 156, 160, 1)),
                                            textAlign: TextAlign.center,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'dengan nama ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromRGBO(
                                                        156, 156, 160, 1)),
                                              ),
                                              Text(
                                                widget._tambahItem
                                                    .listModel[index].name!,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      height: 48,
                                      width: 133,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: const Color.fromRGBO(
                                            88, 86, 214, 1),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          const Text(
                                            'Batalkan',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () => Get.back(),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 48,
                                      width: 133,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: const Color.fromRGBO(
                                            241, 241, 241, 1),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Ya, hapus',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    71, 75, 82, 1),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        widget._tambahItem.listModel
                                            .removeAt(index);
                                      });

                                      Get.back();
                                    },
                                  ),
                                ],
                              )
                            ],
                          );
                        }),
                      );
                    },
                  )
                ],
              ),
              Text(widget._tambahItem.findData(searchBar)[index].desk!)
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
            border: Border.all(color: const Color.fromRGBO(30, 30, 30, 1)),
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
                      // Container(
                      //   width: 102,
                      //   height: 124,
                      //   color: Colors.grey,
                      //   child: Image.asset('assets/ashley2.png'),
                      // ),
                      Text(widget._tambahItem.findData(searchBar)[index].name!),
                    ],
                  ),
                  const Icon(Icons.delete)
                ],
              ),
              Text(widget._tambahItem.findData(searchBar)[index].desk!)
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
