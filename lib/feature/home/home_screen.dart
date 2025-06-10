import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/feature/cart/cart_presenter.dart';
import 'package:ecommerce_app/feature/cart/cart_screen.dart';
import 'package:ecommerce_app/feature/home/home_presenter.dart';
import 'package:ecommerce_app/feature/search/search_screen.dart';
import 'package:ecommerce_app/widgets/list_product_card.dart';

import '../../widgets/base_widget.dart';
import '../../widgets/header_widget.dart';
import '../detail_product/detail_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomePresenter presenter = context.read<HomePresenter>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    presenter.getCategory().whenComplete(() {
      presenter.getListProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width / 2.7;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Shop IT", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                //Push to Search screen
                BaseWidget.push(context, const SearchScreen());
              },
              child: const Icon(Icons.search_sharp, color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () {
                //Push to Cart screen
                context.read<CartPresenter>().getListCart().whenComplete(
                  () => BaseWidget.push(context, const CartScreen()),
                );
              },
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: <Widget>[
            const HeaderWidget('Customer'),
            presenter.listCat.isNotEmpty
                ? Container(
                  height: 34,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: presenter.listCat.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          presenter.changeCat(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color:
                                presenter.isCatSelected(index)
                                    ? Colors.green
                                    : Colors.white,
                          ),
                          child: Text(
                            presenter.listCat[index],
                            style: TextStyle(
                              color:
                                  presenter.isCatSelected(index)
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
                : const SizedBox(),
            presenter.listProduct.isNotEmpty
                ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: presenter.listProduct.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListProductCard(
                        product: presenter.listProduct[index],
                        onClick: () {
                          BaseWidget.push(
                            context,
                            DetailProductScreen(
                              product: presenter.listProduct[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

//mor_2314
//83r5^_
