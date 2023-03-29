import 'package:buscador/src/features/home/controller/home_controller.dart';
import 'package:buscador/src/features/home/view/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const MaterialColor _primaryColor = MaterialColor(
  0xff1351b4, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: const Color(0xffedf5ff), //10%
    100: const Color(0xffd4e5ff), //20%
    200: const Color(0xffadacff), //30%
    300: const Color(0xff81aefc), //40%
    400: const Color(0xff5992ed), //50%
    500: const Color(0xff2670e8), //60%
    600: const Color(0xff155bcb), //70%
    700: const Color(0xff1351b4), //80%
    800: const Color(0xff0c326f), //90%
    900: const Color(0xff071d41), //100%
  },
);

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'rawline',
          // primarySwatch: _primaryColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xff1351b4),
            primaryContainer: const Color(0xffadcdff),
            secondary: const Color(0xff168821),
            secondaryContainer: const Color(0xffe3f5e1),
            error: const Color(0xffb00020),
            background: const Color(0xffffffff),
            onBackground: const Color(0xff000000),
          ),
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (_) => HomePage(),
        },
      ),
    );
  }
}
