import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:squadsyncweb/data/data_source/generating_access_token_register.dart';
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';

class RegisterUserKeyCloakDataSource {
  Future<String> registerUpUser(
      BuildContext context,
      String firstName,
      String lastName,
      String userName,
      String email,
      String passWord,
      String role) async {
    try {
      String url = 'https://thesquadsync.com/auth/admin/realms/SquadSync/users';

      Map<String, dynamic> requestBody = {
        "enabled": true,
        "username": userName,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "emailVerified": true,
        "credentials": [
          {
            "temporary": true,
            "type": "password",
            "value": passWord,
          },
        ],
        "realmRoles": ['Players']
      };

      String requestBodyJson = jsonEncode(requestBody);

      String bearerToken =
          await GeneratingAccessTokenForRegister().generateBearerToken(context);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      };

      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: requestBodyJson,
      );

      if (response.statusCode == 201) {
        return "Successfull";
      } else {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        // Access the errorMessage field
        String errorMessage = jsonData['errorMessage'];
        return errorMessage;
      }
    } catch (e) {
      CustomMaterialBanner().show(context, 'Error occurred: $e');
      return e.toString();
    }
  }
}
