import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/common/utils.dart';
import 'package:tapcart/injection.dart' as di;
import 'package:tapcart/presentation/bloc/auth/login/login_bloc.dart';
import 'package:tapcart/presentation/bloc/auth/member_detail/member_detail_bloc.dart';
import 'package:tapcart/presentation/bloc/product/productlist/product_list_bloc.dart';
import 'package:tapcart/presentation/bloc/store/storedetail/store_detail_bloc.dart';
import 'package:tapcart/presentation/pages/buyer/buyer_detail_cart.dart';
import 'package:tapcart/presentation/pages/buyer/buyer_merchant_page.dart';
import 'package:tapcart/presentation/pages/buyer/buyer_page.dart';
import 'package:tapcart/presentation/pages/buyer/buyer_scan_page.dart';
import 'package:tapcart/presentation/pages/buyer/buyer_summary_cart_page.dart';
import 'package:tapcart/presentation/pages/first_page.dart';
import 'package:tapcart/presentation/pages/seller/seller_login_page.dart';
import 'package:tapcart/presentation/pages/seller/seller_page.dart';
import 'package:tapcart/presentation/pages/seller/seller_register_page.dart';


void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<LoginBloc>()),
        BlocProvider(create: (_) => di.locator<MemberDetailBloc>()),
        BlocProvider(create: (_) => di.locator<StoreDetailBloc>()),
        BlocProvider(create: (_) => di.locator<ProductListBloc>()),
      ],
      child: MaterialApp(
          title: 'TapCart',
          theme: ThemeData.light().copyWith(
            elevatedButtonTheme: kButtonThemeData,
            inputDecorationTheme: MyInputTheme().theme(),
            colorScheme: kColorScheme,
            primaryColor: kLightBrown,
            scaffoldBackgroundColor: Colors.white,
            textTheme: kTextTheme),
          home: const FirstPage(),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case HOME_ROUTE:
                return MaterialPageRoute(builder: (_) => const FirstPage());
              case BUYER_PAGE:
                return MaterialPageRoute(builder: (_)=> const BuyerPage());
              case SELLER_PAGE:
                return MaterialPageRoute(builder: (_)=> const SellerPage());
              case LOGIN_SELLER_PAGE:
                return MaterialPageRoute(builder: (_)=> const LoginSellerPage());
              case REGISTER_SELLER_PAGE:
                return MaterialPageRoute(builder: (_)=> const RegisterSellerPage());
              case BUYER_SCAN_PAGE:
                return MaterialPageRoute(builder: (_)=> const BuyerScanPage());
              case BUYER_DETAIL_CART_PAGE:
                return MaterialPageRoute(builder: (_)=> BuyerDetailCart());
              case BUYER_SUMMARY_CART_PAGE:
                final idMerchant = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (_) => BuyerSummaryCartPage(idStore: idMerchant),
                  settings: settings,
                );
              case BUYER_MERCHANT_PAGE:
                final idMerchant = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (_) => BuyerMerchantPage(storeId: idMerchant),
                  settings: settings,
                );
              default:
                return MaterialPageRoute(builder: (_) {
                  return const Scaffold(
                    body: Center(child: Text("Page not found :(")),
                  );
                });
            }
          }),
    );
  }
}
