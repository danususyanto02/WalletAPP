import 'package:bwa/core.dart';

import 'package:bwa/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
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
                const CustomFormField(
                  title: 'Username',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomFormField(
                  title: 'Full Name',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomFormField(
                  title: 'Email Address',
                ),

                const SizedBox(
                  height: 30,
                ),
                //NOTE: PASSWORD INPUT
                const CustomFormField(title: 'Password', obscureText: true),
                const SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  title: 'Update Now',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/profile-edit-success', (route) => false);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
