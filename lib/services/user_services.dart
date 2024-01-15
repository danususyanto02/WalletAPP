import 'dart:convert';

import 'package:bwa/models/user_edit_form_model.dart';
import 'package:bwa/models/user_model.dart';
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

  Future<List<UserModel>> getRecentUsers() async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.get(Uri.parse('$baseUrl/transfer-history'),
          headers: {'Authorization': token});
      if (res.statusCode == 200) {
        return List<UserModel>.from(
          jsonDecode(res.body)['data'].map(
            (user) => UserModel.fromJson(user),
          ),
        );
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUsersByUsername(String username) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.get(Uri.parse('$baseUrl/users/$username'),
          headers: {'Authorization': token});
      if (res.statusCode == 200) {
        // print(username);
        return List<UserModel>.from(
          jsonDecode(res.body).map(
            (user) => UserModel.fromJson(user),
          ),
        );
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
