import 'package:flutter/material.dart';
import 'package:notes_appwrite/auth_api/auth_api.dart';
import 'package:notes_appwrite/utilities/auth_page_title.dart';
import 'package:notes_appwrite/utilities/auth_redirects.dart';
import 'package:notes_appwrite/utilities/my_text_fields.dart';
import 'package:notes_appwrite/utilities/password_text_field.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticateProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const AuthPageTitle(title: "Register"),
          CustomTextField(
            controller: _nameController,
            hintText: "Username",
            forEmail: false,
            icon: Icons.person_rounded,
            validationText: 'Please Enter a Username',
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            controller: _emailController,
            hintText: "Email",
            forEmail: true,
            icon: Icons.mail_rounded,
            validationText: 'Please Enter an Email Address',
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
                String name = _nameController.text;
                if (_formKey.currentState!.validate()) {
                  authProvider.signUp(
                    email: email,
                    password: password,
                    name: name,
                    context: context,
                  );
                }
              },
              icon: const Icon(Icons.login_rounded),
              label: const Text("Sign Up"),
            ),
          ),
          AuthRedirects(
            text1: "Already have an account? ",
            text2: "Sign-in",
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          )
        ],
      ),
    );
  }
}
