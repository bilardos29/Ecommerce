import 'package:flutter/material.dart';

import 'base_widget.dart';

class CheckoutButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const CheckoutButton(this.text, {required this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          minimumSize: Size(MediaQuery.of(context).size.width, 52),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: BaseWidget.mainTextStyle(
                      colors: Colors.white, size: 16)),
              const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
