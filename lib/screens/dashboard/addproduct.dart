import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbmsapp/components/buttons.dart';
import 'package:dbmsapp/components/txtfields.dart';
import 'package:dbmsapp/constants.dart';
import 'package:dbmsapp/services/auth.dart';
import 'package:dbmsapp/services/db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'dart:io' show Platform;
// import 'package:mongo_dart/mongo_dart.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _pname = TextEditingController();

  final TextEditingController _price = TextEditingController();

  final TextEditingController _stock = TextEditingController();

  String _selectedItem = " ";

  bool _showStock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new product"),
      ),
      body: Container(
        width: Screen(context).width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Tinput(
              controller: _pname,
              hint: "Enter product name",
              label: "Product Name"),
          Tinput(controller: _price, hint: "Enter price", label: "Price"),
          Consts.h5(title: "Maintain Stock"),
          Container(
            width: 300,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: RadioListTile(
                    value: true,
                    groupValue: _showStock,
                    onChanged: (val) {
                      setState(() {
                        _showStock = val!;
                      });
                    },
                    title: const Text("Yes"),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: false,
                    groupValue: _showStock,
                    onChanged: (val) {
                      setState(() {
                        _showStock = val!;
                      });
                    },
                    title: const Text("No"),
                  ),
                ),
              ],
            ),
          ),
          _showStock ? stockWidget() : Container(),
          BtnPrimary(
            title: "Submit",
            onpress: () async {
              // db.remove({});
              String userid = FirebaseAuth.instance.currentUser!.uid;
              Map<String, dynamic> data1 = {
                "userid": userid,
                "product_name": _pname.text,
                "price": _price.text,
                "stock": "no",
              };
              Map<String, dynamic> data2 = {
                "userid": userid,
                "product_name": _pname.text,
                "price": _price.text,
                "stock": _stock.text.toString(),
                "qty_type": _selectedItem,
              };

              Map<String, dynamic> data = _showStock ? data2 : data1;

              DbServices db = DbServices();
              await db.addProduct(json: data);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Product Added"),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }

  Widget stockWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consts.h5(title: "Quantity Type"),
        Container(
          width: 300,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: RadioListTile(
                  value: "Unit",
                  groupValue: _selectedItem,
                  onChanged: (val) {
                    setState(() {
                      _selectedItem = val!;
                    });
                  },
                  title: const Text("Unit"),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  value: "Dozen",
                  groupValue: _selectedItem,
                  onChanged: (val) {
                    setState(() {
                      _selectedItem = val!;
                    });
                  },
                  title: const Text("Dozen"),
                ),
              ),
            ],
          ),
        ),
        Tinput(
            controller: _stock, hint: "Enter stock quantity", label: "Stock"),
      ],
    );
  }
}
