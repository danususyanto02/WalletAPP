import 'dart:convert';
import 'dart:io';

import 'package:bwa/blocs/auth/auth_bloc.dart';
import 'package:bwa/models/signup_form_model.dart';
import 'package:bwa/shared/shared_methods.dart';
import 'package:bwa/shared/theme.dart';
import 'package:bwa/ui/widgets/buttons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetKtpPage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpSetKtpPage({Key? key, required this.data}) : super(key: key);

  @override
  State<SignUpSetKtpPage> createState() => _SignUpSetKtpPageState();
}

class _SignUpSetKtpPageState extends State<SignUpSetKtpPage> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
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
            // print(state);
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
                  'Verify Your\nAccount',
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
                        'Passport/ID Card',
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      CustomFilledButton(
                          title: 'Continue',
                          onPressed: () {
                            if (validate()) {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthRegister(widget.data.copyWith(
                                    ktp: selectedImage == null
                                        ? null
                                        : "data:image/jpeg;base64," +
                                            base64Encode(
                                              File(selectedImage!.path)
                                                  .readAsBytesSync(),
                                            ),
                                  )));
                            } else {
                              showCustomSnackBar(
                                  context, 'Gambar tidak boleh kosong');
                            }
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
                      context.read<AuthBloc>().add(AuthRegister(widget.data));
                    }),
              ],
            );
          }
        },
      ),
    );
  }
}
