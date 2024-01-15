import 'package:bwa/core.dart';
import 'package:bwa/models/user_model.dart';
import 'package:flutter/material.dart';

class TransferReasonUserItem extends StatelessWidget {
  final UserModel user;

  const TransferReasonUserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: user.profilPicture == null
                        ? const AssetImage('assets/img_profile.png')
                        : NetworkImage(user.profilPicture!) as ImageProvider)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name.toString(),
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '${user.username}',
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          if (user.verified == 1)
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 14,
                  color: greenColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Verified',
                  style:
                      greenTextStyle.copyWith(fontSize: 11, fontWeight: medium),
                )
              ],
            ),
        ],
      ),
    );
  }
}
