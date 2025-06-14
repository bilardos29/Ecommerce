import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/feature/cart/cart_presenter.dart';
import 'package:ecommerce_app/feature/search/search_presenter.dart';
import 'package:ecommerce_app/feature/cart/cart_screen.dart';
import 'package:ecommerce_app/widgets/base_widget.dart';
import 'package:ecommerce_app/widgets/search_product_card.dart';
import 'package:ecommerce_app/widgets/search_widget.dart';
import 'package:ecommerce_app/widgets/space_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();
  late SearchPresenter presenter;
  late CartPresenter cartPresenter = context.read<CartPresenter>();

  @override
  Widget build(BuildContext context) {
    presenter = context.watch<SearchPresenter>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Search", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            presenter.clearListSearch();
          },
          child: const Icon(Icons.arrow_back_ios_sharp, color: Colors.black54),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () {
                //Push to Cart screen
                cartPresenter.getListCart().whenComplete(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: <Widget>[
            SearchWidget(
              hint: 'Search',
              controller: search,
              onChanged: (val) {
                presenter.getListProduct(search.text);
              },
              onDelete: presenter.clearListSearch,
            ),
            const Space(h: 12),
            presenter.listSearch.isNotEmpty
                ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: presenter.listSearch.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: SearchProductCard(
                        product: presenter.listSearch[index],
                        onClick: () {
                          cartPresenter
                              .addIntoCart(product: presenter.listSearch[index])
                              .whenComplete(() => Navigator.pop(context));
                        },
                      ),
                    );
                  },
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
