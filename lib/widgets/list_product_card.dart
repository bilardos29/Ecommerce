import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/base_widget.dart';
import 'package:ecommerce_app/widgets/review_widget.dart';
import 'package:ecommerce_app/widgets/space_widget.dart';

import 'package:ecommerce_app/model/product.dart';

class ListProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onClick;

  const ListProductCard({
    required this.product,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.network(product.image!, width: 100),
              ),
            ),
            Space(h: 10),
            Text(
              product.title ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.left,
              style: BaseWidget.mainTextStyle(),
            ),
            Space(h: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'USD ${product.price ?? 0}',
                  style: BaseWidget.mainTextStyle(size: 15, fWeight: FontWeight.bold),
                ),
              ],
            ),
            Space(h: 8),
            Row(
              children: [
                ReviewWidget(product.rating?.rate ?? 0),
                Space(w: 8),
                Text(
                  '${product.rating?.count ?? 0} Reviews',
                  style: BaseWidget.mainTextStyle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
