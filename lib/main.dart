import 'package:flutter/material.dart';
import 'package:pdfclass/routes/app_route.dart';
import 'package:pdfclass/routes/route_name.dart';
import 'package:pdfclass/viewmodel/auth_view_model.dart';
import 'package:pdfclass/viewmodel/bottom_bar_view_model.dart';
import 'package:pdfclass/viewmodel/get_categories_view_model.dart';
import 'package:pdfclass/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => BottomBarViewModel()),
        ChangeNotifierProvider(
            create: (context) => GetCategoriesAndSubCategoriesViewModel()),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Pdf Class",
          theme: ThemeData(primarySwatch: Colors.green),
          //home: const SplashScreen(),
          initialRoute: RouteName.splashScreen,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
