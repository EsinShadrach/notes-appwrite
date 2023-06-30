import 'package:flutter/material.dart';
import 'package:notes_appwrite/utilities/my_animated_icon.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.passwordController});

  final TextEditingController passwordController;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _passwordInvisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: _passwordInvisible,
      autocorrect: false,
      enableSuggestions: false,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Please Enter a Password.';
        }
        if (value.length < 8) {
          return "Password Should at Least 8 Characters Long";
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: "Password",
        labelText: "Password",
        prefixIcon: const Icon(Icons.lock_rounded),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _passwordInvisible = !_passwordInvisible;
            });
          },
          child: MyAnimatedIcon(
            condition: _passwordInvisible,
            firstIcon: Icons.visibility_rounded,
            secondIcon: Icons.visibility_off_rounded,
          ),
        ),
      ),
    );
  }
}
