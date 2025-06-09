import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/space_widget.dart';

class HeaderWidget extends StatelessWidget {
  final String user;

  const HeaderWidget(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hi, $user',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400)),
          const Space(h: 4),
          const Text('What are you looking for today?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
