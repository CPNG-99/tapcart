import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/presentation/bloc/auth/member_detail/member_detail_bloc.dart';
import 'package:tapcart/presentation/widget/seller_card_product.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({Key? key}) : super(key: key);

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<MemberDetailBloc>().add(const OnGetMemberDetail()));
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    child: Image.asset("assets/img/tapcart.png"),
                  ),
                  BlocBuilder<MemberDetailBloc, MemberDetailState>(
                      builder: (context, state) {
                    if (state is MemberDetailLoading) {
                      return const Center();
                    } else if (state is HasMemberDetailData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                state.result.storeName,
                                style: kSubtitle,
                              ),
                              Text(
                                state.result.description,
                                style: kSubtitle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "assets/img/first-screen.jpg",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      );
                    } else if (state is MemberDetailError) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).pushNamed(HOME_ROUTE);
                      });
                    }
                    return const Center();
                  }),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Your Product",
                    style: kButtonText,
                  ),
                  const TextField(
                    cursorColor: Colors.grey,
                    cursorHeight: 20,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: "Search",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Category",
                    style: kSubtitle,
                  ),
                  SizedBox(
                    width: 400,
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: [
                        SellerCardProduct(),
                        SellerCardProduct(),
                        SellerCardProduct(),
                        SellerCardProduct(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Add Product',
        child: Icon(Icons.add),
        backgroundColor: kLightBrown,
      ),
    );
  }
}
