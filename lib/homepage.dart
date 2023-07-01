import 'package:flutter/material.dart';
import 'package:notes_appwrite/auth_api/auth_api.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var authData = context.watch<AuthenticateProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "WELCOME ${authData.username}",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
    );
  }
}
