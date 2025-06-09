import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onClick;

  const IconButtonWidget(this.icon, {required this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 0.5),
          borderRadius: BorderRadius.circular(6)
        ),
        child: Icon(icon, color: Colors.black54),
      ),
    );
  }
}
