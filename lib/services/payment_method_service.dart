import 'dart:convert';

import 'package:bwa/models/payment_method_model.dart';
import 'package:bwa/services/auth_services.dart';
import 'package:bwa/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      final token = await AuthServices().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/bank-list'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        return List<PaymentMethodModel>.from(jsonDecode(res.body).map(
                (paymentMethod) => PaymentMethodModel.fromJson(paymentMethod)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'].toString();
      }
    } catch (e) {
      rethrow;
    }
  }
}
