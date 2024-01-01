import 'package:bwa/core.dart';
import 'package:bwa/ui/widgets/forms.dart';
import 'package:bwa/ui/widgets/transfer_reason_user_item.dart';
import 'package:bwa/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 36,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: 'Username',
            isShowTitle: false,
          ),
          buildResultUsers(),
          const SizedBox(
            height: 100,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

Widget buildRecentUsers() {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        const SizedBox(
          height: 14,
        ),
        const TransferReasonUserItem(
            imageUrl: 'assets/img_friend1.png',
            name: 'Yonna',
            username: 'Yonaan2',
            isVerified: true),
        const TransferReasonUserItem(
            imageUrl: 'assets/img_friend2.png',
            name: 'Jayawardana',
            username: 'jaya23',
            isVerified: true),
        const TransferReasonUserItem(
            imageUrl: 'assets/img_friend3.png',
            name: 'Freya',
            username: 'Frey22',
            isVerified: false),
      ],
    ),
  );
}

Widget buildResultUsers() {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        const SizedBox(
          height: 14,
        ),
        const Center(
          child: Wrap(
            runSpacing: 16,
            spacing: 30,
            children: [
              TransferResultUserItem(
                  imageUrl: 'assets/img_friend1.png',
                  name: 'Yonna',
                  username: 'Yonaan2',
                  isVerified: true),
              TransferResultUserItem(
                  imageUrl: 'assets/img_friend2.png',
                  name: 'Wardana',
                  username: 'jaya23',
                  isVerified: true),
              TransferResultUserItem(
                  imageUrl: 'assets/img_friend3.png',
                  name: 'Freya',
                  username: 'Frey22',
                  isSelected: true,
                  isVerified: false),
            ],
          ),
        )
      ],
    ),
  );
}
