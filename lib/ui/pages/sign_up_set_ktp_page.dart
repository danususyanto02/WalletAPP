import 'package:bwa/shared/theme.dart';
import 'package:bwa/ui/widgets/buttons.dart';
import 'package:bwa/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class SignUpSetKtpPage extends StatelessWidget {
  const SignUpSetKtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: lightBgColor,
      body: ListView(
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
            'Verify Your\nAccount',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //NOTE: EMAIL INPUT

                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: lightBgColor),
                  child: Center(
                    child: Image.asset(
                      'assets/ic_upload.png',
                      width: 32,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Passport/ID Card',
                  style:
                      blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                ),
                const SizedBox(
                  height: 30,
                ),

                const CustomFormField(
                  title: ('Set PIN (6) Digit Number'),
                  obscureText: true,
                ),

                const SizedBox(
                  height: 30,
                ),

                CustomFilledButton(
                    title: 'Continue',
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up-seccess');
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          CustomTextButton(
              title: 'Skip For Now',
              onPressed: () {
                Navigator.pushNamed(context, '/sign-up-seccess');
              }),
        ],
      ),
    );
  }
}