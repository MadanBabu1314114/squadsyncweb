import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:squadsyncweb/data/model/token_response.dart';
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';

class LoginDataSource {
  Future<TokenResponse> loginUser(
      String username, String password, BuildContext context) async {
    try {
      String url =
          'https://squadsync-backend.azurewebsites.net/api/v0.1/login/squadsyncadmin';

      Map<String, String> requestBody = {
        'username': username,
        'password': password,
      };
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: requestBody,
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200) {
        context.go('/homepage');

        return TokenResponse(
            access_token: responseBody['access_token'],
            status: response.statusCode,
            message: responseBody['message']);
      } else {
        CustomMaterialBanner()
            .show(context, "Please Check the Inputs or Check the Internet");
        return TokenResponse(
          message: '',
          status: response.statusCode,
          access_token: '',
        );
      }
    } catch (e) {
      // print(e.toString());
      // CustomMaterialBanner()
      //     .show(context, "Please Check the Inputs or Check the Internet");
      return TokenResponse(
        message: '',
        status: 0,
        access_token: '',
      );
    }
  }

  Future<TokenResponse> loginOrgAdmin(
      String username, String password, BuildContext context) async {
    try {
      String url =
          'https://squadsync-backend.azurewebsites.net/api/v0.1/login/Orgadmin';

      Map<String, String> requestBody = {
        'username': username,
        'password': password,
      };
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: requestBody,
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200) {
        context.go('/homepage');
        return TokenResponse(
            access_token: responseBody['accesstoken'],
            status: response.statusCode,
            message: responseBody['message']);
      } else {
        CustomMaterialBanner()
            .show(context, "Please Check the Inputs or Check the Internet");
        return TokenResponse(
          message: '',
          status: response.statusCode,
          access_token: '',
        );
      }
    } catch (e) {
      print(e.toString());
      CustomMaterialBanner()
          .show(context, "Please Check the Inputs or Check the Internet");
      return TokenResponse(
        message: '',
        status: 0,
        access_token: '',
      );
    }
  }
}
