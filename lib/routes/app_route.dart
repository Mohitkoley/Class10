import 'package:flutter/material.dart';
import 'package:pdfclass/routes/route_name.dart';
import 'package:pdfclass/views/auth/Sign_up_screen.dart';
import 'package:pdfclass/views/auth/sign_in_screen.dart';
import 'package:pdfclass/views/bottom_bar/bottom_bar.dart';
import 'package:pdfclass/views/child_screens/chapter_screen.dart';
import 'package:pdfclass/views/child_screens/pdf_view.dart';
import 'package:pdfclass/views/child_screens/subject_screen.dart';
import 'package:pdfclass/views/splash_screen.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });
      case RouteName.signUpScreen:
        return MaterialPageRoute(builder: (context) {
          return const SignUpScreen();
        });
      case RouteName.signinScreen:
        return MaterialPageRoute(builder: (context) {
          return const SignInScreen();
        });
      case RouteName.bottomBarScreen:
        return MaterialPageRoute(builder: (context) {
          return const BottomBarScreen();
        });
      case RouteName.subjectScreen:
        return MaterialPageRoute(builder: (context) {
          String id = settings.arguments as String;
          return SubjectScreen(
            id: id,
          );
        });
      case RouteName.chapterScreen:
        return MaterialPageRoute(builder: (context) {
          String id = settings.arguments as String;
          return ChapterScreen(
            cid: id,
          );
        });
      case RouteName.pdfView:
        return MaterialPageRoute(builder: (context) {
          Map<String, dynamic> data =
              settings.arguments as Map<String, dynamic>;
          return PdfView(
            data: data,
          );
        });
      // case RouteName.notificationScreen:
      //   return MaterialPageRoute(builder: (context) {
      //     return NotificationScreen();
      //   });
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
