import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbmsapp/components/buttons.dart';
import 'package:dbmsapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
      .collection('products')
      .where(
        "userid",
        isEqualTo: FirebaseAuth.instance.currentUser!.uid,
      )
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory Management"),
      ),
      body: Container(
        padding: Consts.stdpadding(),
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('products').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                // Map<String, dynamic> data =
                // snapshot.data!.docss Map<String, dynamic>;
                // var data = snapshot.data!.docs[0].data()['price']!;
                // print(data);
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                print(documents);
                return ListView(
                    children: documents
                        .map((doc) => Card(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              color: Color.fromARGB(255, 234, 234, 234),
                              child: ListTile(
                                minVerticalPadding: 20,
                                title: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Consts.h5(
                                          title: "Product Name :  ",
                                        ),
                                        Consts.h5(
                                          title: doc['product_name'],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Consts.h5(
                                          title: "Stock Quantity :  ",
                                        ),
                                        Consts.h5(
                                          title: doc['stock'],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        BtnElevated(
                                          title: "Add",
                                          onpress: () {},
                                        ),
                                        BtnElevated(
                                          title: "Remove",
                                          onpress: () {},
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList());
              }
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
