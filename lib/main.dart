import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyae_phyo/core/theme/app_color.dart';
import 'package:pyae_phyo/core/utils/shared/app_state_provider.dart';
import 'package:pyae_phyo/features/home/home_view.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AppState())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pyae Phyo',
      builder: (context, child) =>
          ResponsiveBreakpoints.builder(child: child!, breakpoints: [
        const Breakpoint(start: 0, end: 360, name: 'SMALL_MOBILE'),
        const Breakpoint(start: 361, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ]),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColor.black),
      home: const HomeView(),
    );
  }
}
