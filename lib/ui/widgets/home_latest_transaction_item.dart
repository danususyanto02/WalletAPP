import 'package:bwa/core.dart';
import 'package:flutter/material.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String time;
  final String value;

  const HomeLatestTransactionItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.time,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18),
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            width: 48,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  time,
                  style: greenTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
