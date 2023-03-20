import 'package:binance_test/presentation/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:binance_test/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'resources/resources.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
      overlays: [SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.gothicA1TextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: AppColors.appBackgroundColor,
          primarySwatch: Colors.blue,
        ),
        home: const BottomNavBar(),
      ),
    );
  }
}
