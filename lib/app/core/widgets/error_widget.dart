import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String? error;

  const ErrorMessageWidget({
    Key? key,
    this.error = 'Generic error',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error!, style: const TextStyle(color: Colors.red)),
    );
  }
}
