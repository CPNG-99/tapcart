import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/common/utils.dart';
import 'package:tapcart/domain/entities/cart/cart.dart';
import 'package:tapcart/domain/entities/product/product.dart';
import 'package:tapcart/injection.dart' as di;
import 'package:tapcart/presentation/bloc/auth/login/login_bloc.dart';
import 'package:tapcart/presentation/bloc/auth/member_detail/member_detail_bloc.dart';
import 'package:tapcart/presentation/bloc/cart/get_scan_cart/get_scan_cart_bloc.dart';
import 'package:tapcart/presentation/bloc/cart/purchase/purchase_bloc.dart';
import 'package:tapcart/presentation/bloc/product/create_product/create_product_bloc.dart';
import 'package:tapcart/presentation/bloc/product/delete_product/delete_product_bloc.dart';
import 'package:tapcart/presentation/bloc/product/productlist/product_list_bloc.dart';
import 'package:tapcart/presentation/bloc/product/update_product/update_product_bloc.dart';
import 'package:tapcart/presentation/bloc/store/storedetail/store_detail_bloc.dart';
import 'package:tapcart/presentation/pages/buyer/buyer_detail_cart.dart';
import 'package:tapcart/presentation/pages/buyer/buyer_merchant_page.dart';
import 'package:tapcart/presentation/pages/buyer/buyer_page.dart';
import 'package:tapcart/presentation/pages/buyer/buyer_scan_page.dart';
import 'package:tapcart/presentation/pages/buyer/buyer_summary_cart_page.dart';
import 'package:tapcart/presentation/pages/first_page.dart';
import 'package:tapcart/presentation/pages/seller/home/seller_create_product_page.dart';
import 'package:tapcart/presentation/pages/seller/home/seller_detail_product_page.dart';
import 'package:tapcart/presentation/pages/seller/home/seller_edit_product_page.dart';
import 'package:tapcart/presentation/pages/seller/auth/seller_login_page.dart';
import 'package:tapcart/presentation/pages/seller/profile/seller_edit_profile_page.dart';
import 'package:tapcart/presentation/pages/seller/profile/seller_profile_qr_page.dart';
import 'package:tapcart/presentation/pages/seller/scan/seller_cart_scan_page.dart';
import 'package:tapcart/presentation/pages/seller/seller_page.dart';
import 'package:tapcart/presentation/pages/seller/auth/seller_register_page.dart';

import 'domain/entities/store/store.dart';

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
        BlocProvider(create: (_) => di.locator<PurchaseBloc>()),
        BlocProvider(create: (_) => di.locator<CreateProductBloc>()),
        BlocProvider(create: (_) => di.locator<UpdateProductBloc>()),
        BlocProvider(create: (_) => di.locator<DeleteProductBloc>()),
        BlocProvider(create: (_)=> di.locator<GetScanCartBloc>()),
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
                return MaterialPageRoute(builder: (_) => const BuyerPage());
              case SELLER_PAGE:
                return MaterialPageRoute(builder: (_) => const SellerPage());
              case LOGIN_SELLER_PAGE:
                return MaterialPageRoute(
                    builder: (_) => const LoginSellerPage());
              case REGISTER_SELLER_PAGE:
                return MaterialPageRoute(
                    builder: (_) => const RegisterSellerPage());
              case BUYER_SCAN_PAGE:
                return MaterialPageRoute(builder: (_) => const BuyerScanPage());
              case BUYER_DETAIL_CART_PAGE:
                BuyerDetailCartArgs args =
                    settings.arguments as BuyerDetailCartArgs;
                return MaterialPageRoute(
                    builder: (_) => BuyerDetailCart(
                          args: args,
                        ));
              case BUYER_SUMMARY_CART_PAGE:
                final List<CartItems> cartItems =
                    settings.arguments as List<CartItems>;
                return MaterialPageRoute(
                    builder: (_) => BuyerSummaryCartPage(
                          cartItems: cartItems,
                        ),
                    settings: settings);
              case PRODUCT_DETAIL_PAGE:
                final product = settings.arguments as Product;
                return MaterialPageRoute(
                  builder: (_) => SellerDetailProductPage(product: product),
                  settings: settings,
                );
              case BUYER_MERCHANT_PAGE:
                final idMerchant = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (_) => BuyerMerchantPage(storeId: idMerchant),
                  settings: settings,
                );
              case PRODUCT_CREATE_PAGE:
                return MaterialPageRoute(
                  builder: (_) => const SellerCreateProductPage(),
                );
              case PRODUCT_EDIT_PAGE:
                final product = settings.arguments as Product;
                return MaterialPageRoute(
                  builder: (_) => SellerEditProductPage(product: product),
                  settings: settings,
                );
              case SELLER_EDIT_PROFILE_PAGE:
                return MaterialPageRoute(builder: (_) => const SellerEditProfilePage());
              case SELLER_PROFILE_QR_PAGE:
                final store = settings.arguments as Store;
                return MaterialPageRoute(
                  builder: (_) => SellerProfileQrPage(store: store),
                  settings: settings,
                );
              case SELLER_SCAN_CART_PAGE:
                final purchaseId = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (_) => SellerCartScanPage(purchaseId: purchaseId),
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
