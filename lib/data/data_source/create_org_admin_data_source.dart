import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:squadsyncweb/data/model/address.dart';
import 'package:squadsyncweb/data/model/education.dart';
import 'package:squadsyncweb/data/model/person.dart';
import 'package:squadsyncweb/data/model/reponse_create_org_admin.dart';
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';

class CreateOrgAdminDataSource {
  Future<ResponseCreateOrgAdmin> createOrgAdmin(
      String bearerToken,
      Address address,
      Education education,
      String personRole,
      Person person,
      BuildContext context) async {
    // Define the API URL
    String apiUrl =
        'https://squadsync-backend.azurewebsites.net/api/v0.1/auth/create_orgadmin';

    // Convert the request body to JSON format
    String requestBodyJson = jsonEncode({
      "person": person.toJson(),
      "personrole": {"person_role": "Orgadmin"},
      "address": address.toJson(),
      "education": education.toJson(),
    });

    print(requestBodyJson);

    // Define the request headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken',
    };

    try {
      // Make the POST request
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: requestBodyJson,
      );

      // Check if the request was successful (status code 201)
      if (response.statusCode == 201) {
        CustomMaterialBanner().show(context, "OrgAdmin created successfully");

        print('Response body: ${response.body}');

        return ResponseCreateOrgAdmin.fromJson(jsonDecode(response.body));
      } else {
        CustomMaterialBanner().show(context, "Failed to create OrgAdmin");
        print('Failed to create OrgAdmin. Status code: ${response.statusCode}');

        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle any errors that occurred during the request
      CustomMaterialBanner().show(context, "$error");
      print('Error creating OrgAdmin: $error');
    }
    return ResponseCreateOrgAdmin(
      firstName: '',
      lastName: '',
      emailId: '',
      organization: '',
      message: '',
      status: 0,
    );
  }
}
