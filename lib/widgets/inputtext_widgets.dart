import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  final String hint;
  final Icon icons;
  final bool isPassword;
  final TextEditingController controller;

  const InputTextWidget(
      {required this.hint,
        required this.icons,
        required this.controller,
        this.isPassword = false,
        Key? key})
      : super(key: key);

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  bool isPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? !isPassVisible : false,
        decoration: InputDecoration(
            prefixIcon: widget.icons,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: widget.hint,
            labelText: widget.hint,
            suffixIcon: widget.isPassword
                ? InkWell(
                onTap: () {
                  setState(() {
                    isPassVisible = !isPassVisible;
                  });
                },
                child: Icon(!isPassVisible
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined))
                : SizedBox()));
  }
}

