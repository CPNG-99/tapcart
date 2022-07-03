import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/domain/entities/cart/get_cart.dart';
import 'package:tapcart/presentation/bloc/cart/get_scan_cart/get_scan_cart_bloc.dart';
import 'package:tapcart/presentation/widget/seller_scan_cart_card.dart';

class SellerCartScanPage extends StatefulWidget {
  final String purchaseId;
  const SellerCartScanPage({Key? key, required this.purchaseId}) : super(key: key);

  @override
  State<SellerCartScanPage> createState() => _SellerCartScanPage();
}

class _SellerCartScanPage extends State<SellerCartScanPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
            () => context.read<GetScanCartBloc>().add(OnGetScanCartEvent(widget.purchaseId)));
  }
  // late int _counter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: BlocBuilder<GetScanCartBloc, GetScanCartState>(
                builder: (context, state){
                  if (state is GetScanCartStateLoading){
                    return const CircularProgressIndicator();
                  } else if (state is HasScanCart){

                    return ListView.builder(
                      itemBuilder: (context, idx) {
                        final GetCartItems item = state.result.getCartItems[idx];
                        return SellerScanCartCard(cartItems: item);
                      },
                      itemCount: state.result.getCartItems.length,
                    );
                  }else if (state is GetScanCartStateError){
                    return const Center(child: Text("ERROR"),);
                  }
                 return const Center();
                },
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: kButtonText,
                    ),
                    Text(
                      "_price.toString()",
                      style: kButtonText,
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
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