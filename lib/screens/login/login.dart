import 'package:dbmsapp/components/buttons.dart';
import 'package:dbmsapp/components/txtfields.dart';
import 'package:dbmsapp/constants.dart';
import 'package:dbmsapp/providers/loadings.dart';
import 'package:dbmsapp/routes.dart';
import 'package:dbmsapp/screens/dashboard/homepage.dart';
import 'package:dbmsapp/screens/login/sign_up.dart';
import 'package:dbmsapp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consts.h1(title: "WELCOME BACK !!"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Consts.h2(title: "LOGIN", txtcolor: Consts.kdark),
              ),
              Tinput(
                  hint: "Enter username",
                  label: "Username",
                  controller: _usernameController),
              Tinput(
                hint: "Enter password",
                label: "Password",
                controller: _passController,
                isobsecure: true,
              ),
              BtnPrimary(
                  title: "Login",
                  onpress: () async {
                    await context.read<AuthMethods>().signIn(
                        context: context,
                        email: _usernameController.text.toString(),
                        password: _passController.text.toString());
                  }),
              const SizedBox(
                height: 15,
              ),
              BtnPrimary(
                  bgColor: Consts.kdark,
                  title: "Continue with Google",
                  onpress: () async {
                    await context.read<AuthMethods>().signInWithGoogle();
                    FirebaseAuth.instance
                        .authStateChanges()
                        .listen((User? user) {
                      if (user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Failed login"),
                          ),
                        );
                      }
                    });
                  }),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Consts.span("Don't have an account ? "),
              ),
              BtnText(
                  title: "Create New Account",
                  onpress: () {
                    Rute.pushReplace(context, const SignUpPage());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
