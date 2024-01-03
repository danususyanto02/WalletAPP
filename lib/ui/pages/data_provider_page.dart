import 'package:bwa/core.dart';
import 'package:bwa/shared/shared_methods.dart';
import 'package:bwa/ui/widgets/data_provider_item.dart';
import 'package:flutter/material.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'From Wallet',
            style: TextStyle(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1633 5113 5123 5111',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Balance: ${formatCurrency(500000)}',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Select Provider',
            style: TextStyle(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          const DataProviderItem(
            imageUrl: 'assets/image_provider_indosat.png',
            name: 'Indosat',
            isSelected: true,
          ),
          SizedBox(
            height: 350,
          ),
          CustomFilledButton(
              title: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, '/data-package');
              }),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
