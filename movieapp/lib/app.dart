import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/features/splashScreen/view/screen/splash_screen.dart';
import 'core/configs/style/styles.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
            title: 'Movie App',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.defaultTheme,
            home: SplashScreen()));
  }
}
