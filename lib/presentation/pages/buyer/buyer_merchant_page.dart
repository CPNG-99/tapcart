import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';
import 'package:tapcart/presentation/bloc/product/productlist/product_list_bloc.dart';
import 'package:tapcart/presentation/bloc/store/storedetail/store_detail_bloc.dart';
import 'package:tapcart/presentation/widget/buyer_card_product.dart';

class BuyerMerchantPage extends StatefulWidget {
  final String storeId;
  const BuyerMerchantPage({Key? key, required this.storeId}) : super(key: key);

  @override
  State<BuyerMerchantPage> createState() => _BuyerMerchantPage();
}

class _BuyerMerchantPage extends State<BuyerMerchantPage> {
  late Map<String, dynamic> cartItems = {};

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductListBloc>().add(OnGetProductList(widget.storeId));
      context.read<StoreDetailBloc>().add(OnGetStoreDetail(widget.storeId));
    });
  }

  void setCart(CartItems data) {
    setState(() {
      if (data.quantity == 0) {
        cartItems.remove(data.productId);
      } else {
        cartItems[data.productId] = data;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Column(
                children: [
                  BlocBuilder<StoreDetailBloc, StoreDetailState>(
                      builder: (context, state) {
                    if (state is StoreDetailLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is HasStoreDetail) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "assets/img/first-screen.jpg",
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.result.storeName,
                                    style: kSubtitle,
                                  ),
                                  Text(
                                    state.result.openHours ?? "",
                                    style: kSubtitle,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark_outline,
                                  color: kLightBrown,
                                  size: 30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: kLightBrown,
                                  size: 30,
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    } else if (state is StoreDetailError) {
                      return Center();
                    }
                    return const Center();
                  }),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Category",
              style: kSubtitle,
            ),
            Expanded(
              // width: 400,
              // height: 620,
              child: BlocBuilder<ProductListBloc, ProductListState>(
                  builder: (context, state) {
                if (state is ProductListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HasProductList) {
                  final data = state.result;
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 180, crossAxisCount: 2),
                      itemCount: state.result.length,
                      itemBuilder: (context, index) {
                        final product = data[index];
                        return BuyerCardProduct(
                            product: product, setCart: setCart);
                      });
                } else if (state is ProductListError) {
                  const Center(
                    child: Text(
                      "Fail to fetch products",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else if (state is ProductListEmpty) {
                  return const Center(
                    child: Text("No products yet"),
                  );
                }
                return const Center();
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<CartItems> items = [];
          cartItems.forEach((key, value) {
            items.add(value);
          });
          Navigator.pushNamed(context, BUYER_SUMMARY_CART_PAGE,
              arguments: items);
        },
        tooltip: 'Summary',
        child: const Icon(Icons.shopping_cart),
        backgroundColor: kLightBrown,
      ),
    );
  }
}
