import 'package:flutter/material.dart';

abstract class TextFormFieldValidator {
  String? validator(String? value);
}

class AppTextFormField extends StatelessWidget
    implements TextFormFieldValidator {
  final TextEditingController controller;
  final String input;
  final bool isPassword;

  const AppTextFormField({
    Key? key,
    required this.controller,
    required this.input,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: input,
      ),
      validator: validator,
      obscureText: isPassword,
    );
  }

  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your  ${input.toLowerCase()}";
    }
    return null;
  }
}

class AppEmailTextFormField extends AppTextFormField {
  const AppEmailTextFormField({
    Key? key,
    required super.controller,
  }) : super(key: key, isPassword: false, input: "Email");
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: input,
      ),
      validator: validator,
      obscureText: isPassword,
    );
  }

  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your  ${input.toLowerCase()}";
    }
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
}

class AppConfirmPasswordTextFormField extends AppTextFormField {
  final TextEditingController passwordController;
  const AppConfirmPasswordTextFormField(
      {Key? key,
      required this.passwordController,
      required super.controller,
      required super.input})
      : super(key: key, isPassword: true);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: input,
      ),
      validator: validator,
      obscureText: isPassword,
    );
  }

  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your  ${input.toLowerCase()}";
    }
    if (value != passwordController.text) {
      return "The passwords are not matching";
    }
    return null;
  }
}
