import 'package:bwa/core.dart';
import 'package:bwa/shared/shared_methods.dart';
import 'package:flutter/material.dart';

class PackageItem extends StatelessWidget {
  final int amount;
  final int price;
  final bool isSelected;

  const PackageItem({
    Key? key,
    required this.amount,
    required this.price,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 175,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: isSelected ? blueColor : whiteColor, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$amount GB',
            style: blackTextStyle.copyWith(fontSize: 32, fontWeight: medium),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Balance: ${formatCurrency(500000)}',
            style: greyTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
