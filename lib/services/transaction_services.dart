import 'dart:convert';

import 'package:bwa/models/topup_form_model.dart';
import 'package:bwa/services/auth_services.dart';
import 'package:bwa/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> topUp(TopupFormModel data) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/topup'),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      print(res.body.toString());

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'].toString();
      }
      throw jsonDecode(res.body)['message'].toString();
    } catch (e) {
      rethrow;
    }
  }
}
