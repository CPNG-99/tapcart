import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
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
              case "/":
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
