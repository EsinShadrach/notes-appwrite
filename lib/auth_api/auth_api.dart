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
        const SnackBar(
          content: Text('Account Created successfully!'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
        ),
      );

      if (!response.emailVerification) {
        await verifyMail(context: context);
      }
    } on AppwriteException catch (e) {
      if (e.type == "user_already_exists") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User already Exists!'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error occurred during sign up. Please try again.'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
          ),
        );
      }
    } catch (e) {
      print('ERROR: $e');
      // Handle error
    }
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext? context,
  }) async {
    final account = Account(client);
    try {
      final response = await account.createEmailSession(
        email: email,
        password: password,
      );
      print(response.countryName);
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text("Sign In Successful"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
        ),
      );
    } on AppwriteException catch (e) {
      if (e.type == "user_invalid_credentials") {
        ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(
            content: Text("Invalid Password Or Email"),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
          ),
        );
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(
          const SnackBar(
            content: Text("Sign in Failed, Try again Later."),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> verifyMail({required BuildContext? context}) async {
    Account account = Account(client);
    String url = 'https://cloud.appwrite.io/v1';
    try {
      await account.createVerification(url: url).then((value) =>
          print(
              "THIS IS USER_ID:${value.userId}\nTHIS IS SECRETS:${value.secret}"));
      // final sendVerification = await account.updateVerification(
      //   userId: response.userId,
      //   secret: response.secret,
      // );
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text('Verification Email Sent successfully!'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
        ),
      );
      // print(sendVerification.secret);
    } on AppwriteException catch (e) {
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent[100],
          content: Text(
            // 'Account Created successfully!',
            '${e.message}',
            style: const TextStyle(color: Colors.white),
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
        ),
      );
      print(e.message);
    } catch (e) {
      print(e);
    }
  }
}
