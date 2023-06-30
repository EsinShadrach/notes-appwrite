// ignore_for_file: avoid_print

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

class AuthenticateProvider extends ChangeNotifier {
  final Client client = Client()
    ..setEndpoint('https://cloud.appwrite.io/v1')
    ..setProject(
        '649df74ca17a3e033b4c');

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final Account account = Account(client);
      final response = await account.create(
        name: name,
        userId: ID.unique(),
        email: email,
        password: password,
        
      );
      print(response);
      // Handle success or display error message
    } catch (e) {
      print('Error: $e');
      // Handle error
    }
  }
}
