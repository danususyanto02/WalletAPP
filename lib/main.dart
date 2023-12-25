import 'package:bwa/core.dart';
import 'package:bwa/ui/pages/home_page.dart';
import 'package:bwa/ui/pages/pin_page.dart';
import 'package:bwa/ui/pages/profile_edit_page.dart';
import 'package:bwa/ui/pages/profile_edit_pin_page.dart';
import 'package:bwa/ui/pages/profile_edit_success_page.dart';
import 'package:bwa/ui/pages/profile_page.dart';
import 'package:bwa/ui/pages/sign_up_set_ktp_page.dart';
import 'package:bwa/ui/pages/sign_up_set_profile_page.dart';
import 'package:bwa/ui/pages/sign_up_success.dart';
import 'package:bwa/ui/pages/signup_page.dart';
import 'package:bwa/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: lightBgColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBgColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: blackColor),
          elevation: 0,
          titleTextStyle:
              blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/sign-up-set-profile': (context) => const SignUpSetProfile(),
        '/sign-up-set-ktp': (context) => const SignUpSetKtpPage(),
        '/sign-up-seccess': (context) => const SignUpSuccessPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/pin': (context) => const PinPage(),
        '/profile-edit': (context) => const ProfileEditPage(),
        '/profile-pin': (context) => const ProfileEditPinPage(),
        '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
      },
    );
  }
}
