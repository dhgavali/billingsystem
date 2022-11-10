// import 'package:dbmsapp/components/txtfields.dart';
// import 'package:flutter/material.dart';

// class BillPage extends StatefulWidget {
//   BillPage({super.key});

//   @override
//   State<BillPage> createState() => _BillPageState();
// }

// class _BillPageState extends State<BillPage> {
//   final TextEditingController _custname = TextEditingController();

//   final TextEditingController _mobileNo = TextEditingController();

//   final TextEditingController _email = TextEditingController();

//   final TextEditingController _address = TextEditingController();

//   List<TextEditingController> _controllers = [];

//   List<TextField> _fields = [];

//   List<TextEditingController> _nameControllers = [];
//   List<TextEditingController> _priceControllers = [];
//   List<TextEditingController> _qtyControllers = [];
//   double total = 0;
//   @override
//   void dispose() {
//     for (final controller in _nameControllers) {
//       controller.dispose();
//     }
//     for (final controller in _priceControllers) {
//       controller.dispose();
//     }
//     for (final controller in _qtyControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   Widget _addTile() {
//     return ListTile(
//       title: Icon(Icons.add),
//       onTap: () {
//         final controller = TextEditingController();
//         final field = TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             border: const OutlineInputBorder(),
//             labelText: "name${_controllers.length + 1}",
//           ),
//         );

//         setState(() {
//           _nameControllers.add(controller);
//           _fields.add(field);
//         });
//       },
//     );
//   }

//   Widget _deletetile(controller) {
//     return ListTile(
//       title: const Icon(Icons.delete),
//       onTap: () {
//         setState(() {
//           _controllers.remove(controller);
//         });
//       },
//     );
//   }

//   Widget _listView(double width) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: _fields.length,
//       itemBuilder: (context, index) {
//         return Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               margin: const EdgeInsets.all(5),
//               child: _fields[index],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _okButton() {
//     return ElevatedButton(
//       onPressed: () async {
//         String text = _controllers
//             .where((element) => element.text != "")
//             .fold("", (acc, element) => acc += "${element.text}\n");
//         final alert = AlertDialog(
//           title: Text("Count: ${_controllers.length}"),
//           content: Text(text.trim()),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//         await showDialog(
//           context: context,
//           builder: (BuildContext context) => alert,
//         );
//         setState(() {});
//       },
//       child: Text("OK"),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(title: Text("Generate Bill")),
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 12,
//             vertical: 12,
//           ),
//           child: Form(
//               child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Tinput(
//                   controller: _custname,
//                   hint: "Enter Customer Name",
//                   label: "Customer Name"),
//               Tinput(
//                 controller: _mobileNo,
//                 hint: "Enter Mobile Number",
//                 label: "Mobile No.",
//               ),
//               _addTile(),
//               Expanded(child: _listView(width)),
//               _okButton(),
//             ],
//           )),
//         ),
//       ),
//     );
//   }
// }
import 'package:dbmsapp/components/txtfields.dart';
import 'package:flutter/material.dart';

class BillPage extends StatefulWidget {
  BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final TextEditingController _custname = TextEditingController();

  final TextEditingController _mobileNo = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _address = TextEditingController();

  List<TextEditingController> _controllers = [];

  List<TextField> _fields = [];

  List<TextEditingController> _nameControllers = [];
  List<TextEditingController> _priceControllers = [];
  List<TextEditingController> _qtyControllers = [];
  double total = 0;
  @override
  void dispose() {
    for (final controller in _nameControllers) {
      controller.dispose();
    }
    for (final controller in _priceControllers) {
      controller.dispose();
    }
    for (final controller in _qtyControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _deletetile(controller) {
    return ListTile(
      title: const Icon(Icons.delete),
      onTap: () {
        setState(() {
          _controllers.remove(controller);
        });
      },
    );
  }

  Widget _listView(double width) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _fields.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: _fields[index],
            ),
          ],
        );
      },
    );
  }

  Widget _okButton() {
    return ElevatedButton(
      onPressed: () async {
        String text = _controllers
            .where((element) => element.text != "")
            .fold("", (acc, element) => acc += "${element.text}\n");
        final alert = AlertDialog(
          title: Text("Count: ${_controllers.length}"),
          content: Text(text.trim()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
        await showDialog(
          context: context,
          builder: (BuildContext context) => alert,
        );
        setState(() {});
      },
      child: Text("OK"),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Generate Bill")),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          child: Form(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Tinput(
                  controller: _custname,
                  hint: "Enter Customer Name",
                  label: "Customer Name"),
              Tinput(
                controller: _mobileNo,
                hint: "Enter Mobile Number",
                label: "Mobile No.",
              ),
              ElevatedButton(
                  onPressed: () async {
                    List<ProductEntry> persons = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SOF(),
                      ),
                    );
                    if (persons != null) persons.forEach(print);
                  },
                  child: Icon(Icons.add)),
              Expanded(child: _listView(width)),
              _okButton(),
            ],
          )),
        ),
      ),
    );
  }
}

class ProductEntry {
  final String pname;
  final String price;
  final String qty;

  ProductEntry(this.pname, this.price, this.qty);
  @override
  String toString() {
    return 'Product: name= $pname, price= $price, qty= $qty';
  }
}

class SOF extends StatefulWidget {
  @override
  _SOFState createState() => _SOFState();
}

class _SOFState extends State<SOF> {
  final TextEditingController _custname = TextEditingController();

  final TextEditingController _mobileNo = TextEditingController();

  var nameTec = <TextEditingController>[];
  var priceTec = <TextEditingController>[];
  var qtyTec = <TextEditingController>[];
  var cards = <Card>[];

  Card createCard() {
    var nameController = TextEditingController();
    var priceController = TextEditingController();
    var qtyController = TextEditingController();
    nameTec.add(nameController);
    priceTec.add(priceController);
    qtyTec.add(qtyController);
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Product Name')),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price')),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: TextField(
                controller: qtyController,
                decoration: InputDecoration(labelText: 'Qty')),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<ProductEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var name = nameTec[i].text;
      var price = priceTec[i].text;
      var qty = qtyTec[i].text;
      entries.add(
        ProductEntry(
          name,
          price,
          qty,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return cards[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('add new'),
              onPressed: () => setState(() => cards.add(createCard())),
            ),
          )
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),
    );
  }
}
