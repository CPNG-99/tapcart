import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/common/utils.dart';
import 'package:tapcart/injection.dart' as di;
import 'package:tapcart/presentation/bloc/store/storedetail/store_detail_bloc.dart';
import 'package:tapcart/presentation/pages/buyer_page.dart';
import 'package:tapcart/presentation/pages/first_page.dart';
import 'package:tapcart/presentation/pages/login_buyer_page.dart';

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
        BlocProvider(create: (_) => di.locator<StoreDetailBloc>()),
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
          home: const LoginBuyerPage(),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case HOME_ROUTE:
                return MaterialPageRoute(builder: (_) => const FirstPage());
              case BUYER_PAGE:
                return MaterialPageRoute(builder: (_)=> const BuyerPage());
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
