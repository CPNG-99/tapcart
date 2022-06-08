import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/common/utils.dart';
import 'package:tapcart/injection.dart' as di;
import 'package:tapcart/presentation/bloc/store/storedetail/store_detail_bloc.dart';

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
              colorScheme: kColorScheme,
              primaryColor: kLightBrown,
              scaffoldBackgroundColor: Colors.white,
              textTheme: kTextTheme),
          home: const Scaffold(
            body: Center(child: Text("Home")),
          ),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case HOME_ROUTE:
                return MaterialPageRoute(
                    builder: (_) => const Scaffold(
                          body: Center(child: Text("Home")),
                        ));
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
