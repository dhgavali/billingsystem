import 'package:dbmsapp/components/buttons.dart';
import 'package:dbmsapp/screens/dashboard/addproduct.dart';
import 'package:dbmsapp/screens/dashboard/billpage.dart';
import 'package:dbmsapp/screens/dashboard/components/cards.dart';
import 'package:dbmsapp/screens/dashboard/dashboard.dart';
import 'package:dbmsapp/screens/dashboard/inventory.dart';
import 'package:dbmsapp/screens/dashboard/manage_prod.dart';
import 'package:dbmsapp/screens/dashboard/menu_pages/shop_setting.dart';
import 'package:dbmsapp/screens/dashboard/transactions.dart';
import 'package:dbmsapp/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:dbmsapp/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: (size.width < 700)
          ? AppBar(
              title: const Text("Home page"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (Route<dynamic> route) => false);
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                  ),
                )
              ],
            )
          : AppBar(
              title: Row(children: [
                BtnText(
                  title: "homepage",
                  onpress: () {},
                ),
                const SizedBox(
                  width: 20,
                ),
                BtnText(
                  title: "manage",
                  onpress: () {},
                ),
              ]),
            ),
      drawer: (size.width < 700) ? const Drawer() : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                FeatureCard(
                  text: "Create Bill",
                  icon: Icons.receipt,
                  onpress: () {
                    Rute.push(context, SOF());
                  },
                ),
                FeatureCard(
                  text: "Transactions",
                  icon: Icons.payment,
                  onpress: () {
                    Rute.push(context, const OldTransactions());
                  },
                ),
                FeatureCard(
                  text: "Add Products",
                  icon: Icons.add,
                  onpress: () {
                    Rute.push(context, const AddProduct());
                  },
                ),
                FeatureCard(
                  text: "Manage Products",
                  icon: Icons.store,
                  onpress: () {
                    Rute.push(context, const ManageProducts());
                  },
                ),
                FeatureCard(
                  text: "Inventory Management",
                  icon: Icons.store,
                  onpress: () {
                    Rute.push(context, const InventoryPage());
                  },
                ),
                FeatureCard(
                  text: "DashBoard",
                  icon: Icons.settings,
                  onpress: () {
                    Rute.push(context, const Dashboard());
                  },
                ),
                FeatureCard(
                  text: "Shop Setting",
                  icon: Icons.settings,
                  onpress: () {
                    Rute.push(context, const ShopSetting());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
