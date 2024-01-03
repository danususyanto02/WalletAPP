// ignore_for_file: prefer_const_constructors

import 'package:bwa/core.dart';
import 'package:bwa/ui/widgets/forms.dart';
import 'package:bwa/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Paket Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'From Wallet',
            style: TextStyle(fontSize: 16, fontWeight: semiBold),
          ),
          const CustomFormField(
            title: '+628',
            isShowTitle: false,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Pilih Paket',
            style: TextStyle(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              runSpacing: 30,
              spacing: 30,
              children: [
                PackageItem(
                  amount: 50,
                  price: 20000,
                  isSelected: true,
                ),
                PackageItem(
                  amount: 50,
                  price: 20000,
                  isSelected: false,
                ),
                PackageItem(
                  amount: 50,
                  price: 20000,
                  isSelected: false,
                ),
              ]),
          SizedBox(
            height: 85,
          ),
          CustomFilledButton(
              title: 'Continue',
              onPressed: () async {
                if (await Navigator.pushNamed(context, '/pin') == true) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/topup-success', (route) => false);
                }
              }),
        ],
      ),
    );
  }
}
