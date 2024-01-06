import 'dart:math';

import 'package:bwa/blocs/auth/auth_bloc.dart';
import 'package:bwa/models/signin_form_model.dart';
import 'package:bwa/shared/shared_methods.dart';
import 'package:bwa/shared/theme.dart';
import 'package:bwa/ui/widgets/buttons.dart';
import 'package:bwa/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: lightBgColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                Container(
                  width: 155,
                  height: 50,
                  margin: const EdgeInsets.only(top: 100, bottom: 100),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img_logo_light.png')),
                  ),
                ),
                Text(
                  'Sign In &\nGrow Your Finance',
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //NOTE: EMAIL INPUT
                      CustomFormField(
                        title: 'Email Address',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      //NOTE: PASSWORD INPUT
                      CustomFormField(
                        title: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(
                          title: 'Forgot Password',
                          width: 150,
                          height: 50,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomFilledButton(
                        title: 'Sign In',
                        onPressed: () {
                          if (validate()) {
                            context.read<AuthBloc>().add(
                                  AuthLogin(
                                    SignInFormModel(
                                        email: emailController.text,
                                        password: passwordController.text),
                                  ),
                                );
                          } else {
                            showCustomSnackBar(
                                context, 'Semua field harus diisi');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextButton(
                          title: 'Create New Account',
                          onPressed: () {
                            Navigator.pushNamed(context, '/sign-up');
                          }),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
