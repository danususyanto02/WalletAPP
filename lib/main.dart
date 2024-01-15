import 'package:bwa/blocs/auth/auth_bloc.dart';
import 'package:bwa/blocs/user/user_bloc.dart';
import 'package:bwa/core.dart';
import 'package:bwa/ui/pages/data_package_page.dart';
import 'package:bwa/ui/pages/data_provider_page.dart';
import 'package:bwa/ui/pages/data_success_page.dart';
import 'package:bwa/ui/pages/home_page.dart';
import 'package:bwa/ui/pages/pin_page.dart';
import 'package:bwa/ui/pages/profile_edit_page.dart';
import 'package:bwa/ui/pages/profile_edit_pin_page.dart';
import 'package:bwa/ui/pages/profile_edit_success_page.dart';
import 'package:bwa/ui/pages/profile_page.dart';
import 'package:bwa/ui/pages/sign_up_success.dart';
import 'package:bwa/ui/pages/signup_page.dart';
import 'package:bwa/ui/pages/splash_page.dart';
import 'package:bwa/ui/pages/topup_page.dart';
import 'package:bwa/ui/pages/topup_success.dart';
import 'package:bwa/ui/pages/transfer_amount_page.dart';
import 'package:bwa/ui/pages/transfer_page.dart';
import 'package:bwa/ui/pages/transfer_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc()..add(AuthGetCurrentUser())),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: MaterialApp(
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
          '/sign-up-seccess': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
          '/topup': (context) => const TopupPage(),
          '/topup-success': (context) => const TopupSuccessPage(),
          '/transfer': (context) => const TransferPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/data-provider': (context) => const DataProviderPage(),
          '/data-package': (context) => const DataPackagePage(),
          '/data-success': (context) => const DataSuccessPage(),
        },
      ),
    );
  }
}
