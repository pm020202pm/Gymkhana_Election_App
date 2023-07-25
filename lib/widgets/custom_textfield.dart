import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.controller, this.labelText, this.hintText, required this.obscureText, required this.boxHeight, this.validator}) : super(key: key);
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final double boxHeight;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxHeight,
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 14,),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 13),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlue, width: 0,),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlue, width: 1,),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1,),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1,),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          filled: true,
        ),
      ),
    );
  }
}
