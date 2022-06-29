import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';
import 'package:tapcart/presentation/bloc/cart/purchase/purchase_bloc.dart';
import 'package:tapcart/presentation/widget/buyer_summary_card.dart';

class BuyerSummaryCartPage extends StatefulWidget {
  final List<CartItems> cartItems;

  const BuyerSummaryCartPage({Key? key, required this.cartItems})
      : super(key: key);

  @override
  State<BuyerSummaryCartPage> createState() => _BuyerSummaryCartPageState();
}

class _BuyerSummaryCartPageState extends State<BuyerSummaryCartPage> {
  late int _price = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.cartItems) {
      setState(() {
        _price += item.total;
      });
    }
  }

  // late int _counter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, idx) {
                  final CartItems item = widget.cartItems[idx];
                  return BuyerSummaryCard(product: item);
                },
                itemCount: widget.cartItems.length,
              ),
            ),
            Column(
              children: [
                BlocBuilder<PurchaseBloc, PurchaseState>(
                    builder: (context, state) {
                  if (state is PurchaseLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is HasPurchaseData) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).pushNamed(BUYER_DETAIL_CART_PAGE);
                    });
                  } else if (state is PurchaseError) {
                    return Center(child: Text(state.message));
                  }
                  return const Center();
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: kButtonText,
                    ),
                    Text(
                      _price.toString(),
                      style: kButtonText,
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Cart payload = Cart(widget.cartItems);
                      context.read<PurchaseBloc>().add(OnPurchase(payload));
                    },
                    child: const Center(
                      child: Text("Create Cart"),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
