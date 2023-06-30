import 'package:flutter/material.dart';
import 'package:notes_appwrite/auth_api/auth_api.dart';
import 'package:notes_appwrite/utilities/auth_page_title.dart';
import 'package:notes_appwrite/utilities/auth_redirects.dart';
import 'package:notes_appwrite/utilities/my_text_fields.dart';
import 'package:notes_appwrite/utilities/password_text_field.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticateProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const AuthPageTitle(title: "Login"),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            controller: _emailController,
            hintText: "Email",
            forEmail: true,
            icon: Icons.mail_rounded,
            validationText: 'Please Your Email Address.',
          ),
          const SizedBox(
            height: 15,
          ),
          PasswordTextField(
            passwordController: _passwordController,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;
                if (_formKey.currentState!.validate()) {
                  authProvider.signIn(
                    email: email,
                    password: password,
                    context: context,
                  );
                }
              },
              icon: const Icon(Icons.login_rounded),
              label: const Text("Login"),
            ),
          ),
          AuthRedirects(
            text1: "Don't have an account? ",
            text2: "Login",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
