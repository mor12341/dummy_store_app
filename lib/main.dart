import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/app_router.dart';
import 'core/locator.dart';

void main() {
  setupLocator();
  runApp(const DummyStoreApp());
}

class DummyStoreApp extends StatelessWidget {
  const DummyStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: 'Dummy Store App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
