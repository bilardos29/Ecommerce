import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/space_widget.dart';

import 'base_widget.dart';
import 'iconbutton_widget.dart';

class CounterWidget extends StatelessWidget {
  final int total;
  final VoidCallback onMinus;
  final VoidCallback onAdd;
  final VoidCallback onDelete;

  const CounterWidget(
      {required this.total,
      required this.onMinus,
      required this.onAdd,
      required this.onDelete,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          IconButtonWidget(Icons.remove, onClick: onMinus),
          const Space(w: 12),
          Text('$total', style: BaseWidget.mainTextStyle()),
          const Space(w: 12),
          IconButtonWidget(Icons.add, onClick: onAdd),
        ]),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.black54, size: 20),
          onPressed: onDelete,
        )
      ],
    );
  }
}
