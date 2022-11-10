import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DbServices {
  // add product
  Future<void> addProduct({required Map<String, dynamic> json}) async {
    String currentUser = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection("products").add(json);
    // await FirebaseFirestore.instance
    //     .collection("products").where()
  }

// fetch products

  Future<QuerySnapshot> getProducts() async {
    String currentUser = FirebaseAuth.instance.currentUser!.uid;
    // List<Map<String, dynamic>> res = [];
    return await FirebaseFirestore.instance
        .collection("products")
        .where("userid", isEqualTo: currentUser)
        .get();
  }

  //delete product
  Future<void> deleteProduct({required String product_id}) async {
    String currentUser = FirebaseAuth.instance.currentUser!.uid;

    // await FirebaseFirestore.instance
    //     .collection("products")
    //     .doc(currentUser)
    //     .update();
  }
}
