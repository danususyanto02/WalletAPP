import 'package:bwa/shared/theme.dart';
import 'package:bwa/ui/widgets/buttons.dart';
import 'package:bwa/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class SignUpSetProfile extends StatelessWidget {
  const SignUpSetProfile({super.key});

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
            'Join Us to Unlock\nYour Growth',
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
                      image: const DecorationImage(
                          image: AssetImage('assets/img_profile.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      color: lightBgColor),
                ),

                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Freyanashifa Jayawardana',
                  style:
                      blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                ),
                const SizedBox(
                  height: 30,
                ),

                const CustomFormField(title: ('Set PIN (6) Digit Number')),

                const SizedBox(
                  height: 50,
                ),

                CustomFilledButton(
                    title: 'Continue',
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up-set-ktp');
                    }),
              ],
            ),
          ),
          CustomTextButton(
              title: 'Sign IN',
              onPressed: () {
                Navigator.pushNamed(context, '/sign-up');
              }),
        ],
      ),
    );
  }
}
