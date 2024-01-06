import 'dart:convert';

import 'package:bwa/models/user_edit_form_model.dart';
import 'package:bwa/services/auth_services.dart';
import 'package:bwa/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class UserServices {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.put(
        Uri.parse('$baseUrl/user-update'),
        body: data.toJson(),
        headers: {'Authorization': token},
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
