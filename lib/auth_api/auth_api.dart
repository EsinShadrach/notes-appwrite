// ignore_for_file: avoid_print

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

class AuthenticateProvider extends ChangeNotifier {
  final Client client = Client()
    ..setEndpoint('https://cloud.appwrite.io/v1')
    ..setProject('649df74ca17a3e033b4c');

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required context,
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account Created successfully!')),
      );
    } on AppwriteException catch (e) {
      if (e.type == "user_already_exists") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User already Exists!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error occurred during sign up. Please try again.'),
          ),
        );
      }
    } catch (e) {
      print('ERROR: $e');
      // Handle error
    }
    notifyListeners();
  }
}
