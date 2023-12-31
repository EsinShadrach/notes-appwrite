import 'package:flutter/material.dart';
import 'package:notes_appwrite/auth_pages/sign_in.dart';
import 'package:notes_appwrite/auth_pages/sign_up.dart';
import 'package:notes_appwrite/homepage.dart';
import 'package:provider/provider.dart';

import 'auth_api/auth_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticateProvider(),
      child: MaterialApp(
        routes: {
          '/': (context) => const AuthContainer(child: SignIn()),
          '/sign-up': (context) => const AuthContainer(child: SignUp()),
          '/homepage': (context) => const Homepage(),
        },
        title: "Note Appwrite",
        theme: ThemeData(
          colorSchemeSeed: Colors.indigo,
          brightness: Brightness.light,
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          colorSchemeSeed: Colors.indigo,
          brightness: Brightness.dark,
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        // home: const AuthContainer(
        //   child: ,
        // ),
      ),
    );
  }
}

class AuthContainer extends StatefulWidget {
  const AuthContainer({super.key, required this.child});

  final Widget child;
  @override
  State<AuthContainer> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthenticateProvider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
