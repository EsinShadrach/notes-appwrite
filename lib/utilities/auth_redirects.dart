import 'package:flutter/material.dart';

class AuthRedirects extends StatelessWidget {
  const AuthRedirects({
    super.key,
    required this.text1,
    required this.text2,
    required this.onPressed,
  });
  final String text1;
  final String text2;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text.rich(
        TextSpan(
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          children: [
            TextSpan(
              text: text1,
            ),
            TextSpan(
              text: text2,
              semanticsLabel: text2,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}