import 'package:dbmsapp/constants.dart';
import 'package:dbmsapp/providers/loadings.dart';
import 'package:dbmsapp/providers/visibility.dart';
import 'package:dbmsapp/screens/login/login.dart';
import 'package:dbmsapp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VisibilityProvider()),
        ChangeNotifierProvider(create: (context) => LoadingProvider()),
        StreamProvider(
          initialData: null,
          create: (context) =>
              Provider.of<AuthMethods>(context, listen: false).authStateChanges,
        ),
        Provider<AuthMethods>(
          create: (context) => AuthMethods(FirebaseAuth.instance),
        ),
      ],
      child: MaterialApp(
        home: const LoginPage(),
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(backgroundColor: Consts.kdark)),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
