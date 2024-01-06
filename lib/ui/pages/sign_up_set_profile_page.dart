import 'dart:convert';
import 'dart:io';

import 'package:bwa/models/signup_form_model.dart';
import 'package:bwa/shared/shared_methods.dart';
import 'package:bwa/shared/theme.dart';
import 'package:bwa/ui/pages/sign_up_set_ktp_page.dart';
import 'package:bwa/ui/widgets/buttons.dart';
import 'package:bwa/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetProfile extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpSetProfile({Key? key, required this.data}) : super(key: key);

  @override
  State<SignUpSetProfile> createState() => _SignUpSetProfileState();
}

class _SignUpSetProfileState extends State<SignUpSetProfile> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    } else {
      return true;
    }
  }

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

                GestureDetector(
                  onTap: () async {
                    final image = await selectImage();
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBgColor,
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              image: FileImage(
                                File(selectedImage!.path),
                              ),
                            ),
                    ),
                    child: selectedImage != null
                        ? null
                        : Center(
                            child: Image.asset(
                            'assets/ic_upload.png',
                            width: 35,
                          )),
                  ),
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

                CustomFormField(
                  title: ('Set PIN (6) Digit Number'),
                  controller: pinController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(
                  height: 50,
                ),

                CustomFilledButton(
                    title: 'Continue',
                    onPressed: () {
                      if (validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpSetKtpPage(
                              data: widget.data.copyWith(
                                pin: pinController.text,
                                profilePicture: selectedImage == null
                                    ? null
                                    : "data:image/jpeg;base64," +
                                        base64Encode(
                                          File(selectedImage!.path)
                                              .readAsBytesSync(),
                                        ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        showCustomSnackBar(context, 'Pin Harus 6 Digit');
                      }
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
