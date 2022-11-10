import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbmsapp/constants.dart';
import 'package:dbmsapp/services/db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManageProducts extends StatefulWidget {
  const ManageProducts({super.key});

  @override
  State<ManageProducts> createState() => _ManageProductsState();
}

class _ManageProductsState extends State<ManageProducts> {
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
        title: Text("Manage Products"),
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
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Consts.h5(
                                      title: doc['product_name'],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit),
                                          color: Consts.kdark,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                  title: Text(
                                                      "Are you sure want to delete this product?"),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () async {
                                                          // TODO: Delete Product;
                                                          // print(doc[
                                                          //     'product_name']);

                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "products")
                                                              .doc(doc
                                                                  .reference.id)
                                                              .delete();
                                                          Navigator.pop(
                                                              context);
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                                      content: Text(
                                                                          "delete Successfully !!")));
                                                          setState(() {});
                                                        },
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Consts
                                                                        .kdark)),
                                                        child: Text("Yes")),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text("No"),
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .grey
                                                                      .shade200),
                                                          foregroundColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .black87)),
                                                    )
                                                  ]),
                                            );
                                          },
                                          color: Consts.kprimary,
                                          icon: Icon(Icons.delete_forever),
                                        )
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
