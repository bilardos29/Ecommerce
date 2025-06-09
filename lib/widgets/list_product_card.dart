import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/base_widget.dart';
import 'package:ecommerce_app/widgets/review_widget.dart';
import 'package:ecommerce_app/widgets/space_widget.dart';

import '../model/product.dart';

class ListProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onClick;

  const ListProductCard(
      {required this.product, required this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey, width: 0.5)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.network(product.image!, width: 100, height: 100),
            ),
            Expanded(
              child: Text(product.title ?? '',
                  overflow: TextOverflow.fade,
                  maxLines: 3,
                  style: BaseWidget.mainTextStyle()),
            ),
            Space(h: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('USD ${product.price ?? 0}',
                    style: BaseWidget.mainTextStyle()),
              ],
            ),
            Space(h: 8),
            Row(
              children: [
                ReviewWidget(product.rating?.rate ?? 0),
                const Space(w: 8),
                Text('${product.rating?.count ?? 0} Reviews',
                    style: BaseWidget.mainTextStyle()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
