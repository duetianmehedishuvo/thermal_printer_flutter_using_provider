import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/provider/theme_provider.dart';

void showCustomSnackBar(String message, BuildContext context, {bool isError = true}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    content: Text(message, style: TextStyle(color: Provider.of<ThemeProvider>(context, listen: false).darkTheme ? Colors.white : Colors.black)),
  ));
}
