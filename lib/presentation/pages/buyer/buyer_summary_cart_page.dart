import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/domain/entities/product/product.dart';
import 'package:tapcart/presentation/bloc/product/productlist/product_list_bloc.dart';
import 'package:tapcart/presentation/widget/buyer_summary_card.dart';

class BuyerSummaryCartPage extends StatefulWidget{
  final String idStore;

  const BuyerSummaryCartPage({Key? key, required this.idStore}) : super(key: key);

  @override
  State<BuyerSummaryCartPage> createState() => _BuyerSummaryCartPageState();
}

class _BuyerSummaryCartPageState extends State<BuyerSummaryCartPage> {
  late int _price = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductListBloc>().add(OnGetProductList(widget.idStore));
    });
  }

  void _getItemStatus(productId) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedMap = prefs.getString(productId) ?? "0";
    Map<String,dynamic> decodedMap = json.decode(encodedMap);
    int qty = decodedMap["qty"];
    int price = decodedMap["total"];

    if(encodedMap!="0" && qty!=0){
      setState(() {
        _price = qty*price;
        print(_price);
      });
    }else{
      _price = 0;
    }
  }
  // void _getTotalPrice() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String encodedMap = prefs.getString(productId) ?? "0";
  // }


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
              child: BlocBuilder<ProductListBloc, ProductListState>(
                  builder: (context, state){
                    if (state is ProductListLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is HasProductList) {
                      final data = state.result;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          _getItemStatus(data[index].productId);
                          final Product product = data[index];
                          return BuyerSummaryCard(product: product);
                        },
                        itemCount: data.length,
                      );
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
                    return Center();
                  }
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: kButtonText,),
                    Text(_price.toString(), style: kButtonText,),
                  ],
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, BUYER_DETAIL_CART_PAGE);
                  },
                  child: Center(
                    child: Text("Create Cart"),
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}