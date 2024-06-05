import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';

class GeneratingAccessTokenForRegister {
  Future<String> generateBearerToken(BuildContext context) async {
    // Define endpoint URL
    String url =
        'https://thesquadsync.com/auth/realms/SquadSync/protocol/openid-connect/token';

    // Define request body parameters
    Map<String, String> requestBody = {
      'client_id': 'ManageAccess',
      'client_secret': 'HQGDKJQyx2M4NX1dTWrhgqTeimshuWEg',
      'grant_type': 'client_credentials',
    };

    // Send POST request
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: requestBody,
      );

      // Check response status code
      if (response.statusCode == 200) {
        // Request successful, return token
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse['access_token'];
      } else {
        // ignore: use_build_context_synchronously
        CustomMaterialBanner().show(
            context, "Failed to generate bearer token: ${response.statusCode}");
        return "No";
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      CustomMaterialBanner()
          .show(context, 'Failed to generate bearer token: $e');
      return "No";
    }
  }
}
