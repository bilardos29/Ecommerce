import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/review_widget.dart';
import 'package:ecommerce_app/widgets/space_widget.dart';
import 'package:ecommerce_app/model/product.dart';
import 'base_widget.dart';

class SearchProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onClick;

  const SearchProductCard({
    required this.product,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey, width: 0.7),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Image.network(product.image!, width: 60, height: 60),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: BaseWidget.mainTextStyle(size: 15),
                    ),
                    Space(h: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'USD ${product.price ?? 0}',
                          style: BaseWidget.mainTextStyle(
                            fWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Space(h: 16),
                    Row(
                      children: [
                        ReviewWidget(
                          product.rating?.rate ?? 0,
                          color: Colors.black54,
                        ),
                        const Space(w: 8),
                        Text(
                          '${product.rating?.count ?? 0} Reviews',
                          style: BaseWidget.mainTextStyle(
                            colors: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
