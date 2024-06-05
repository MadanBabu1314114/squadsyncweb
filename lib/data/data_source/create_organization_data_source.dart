import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:squadsyncweb/data/model/address.dart';
import 'package:squadsyncweb/data/model/organization.dart';
import 'package:squadsyncweb/data/model/response_create_organization.dart';
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';

class CreateOrganizationDataSource {
  Future<ResponseCreateOrganization> createOrganization(
      Address address,
      Organization organization,
      String bearerToken,
      String sports,
      BuildContext context) async {
    print(bearerToken);
    // Define the API URL
    String apiUrl =
        'https://squadsync-backend.azurewebsites.net/api/v0.1/organization/createorganization/';

    // Define the request body
    Map<String, dynamic> requestBody = {
      "organization": {
        "legal_name": organization.legalName,
        "telephone": organization.telephone,
        "org_type": organization.orgType,
        "organization_sport": organization.organizationSport,
        "organization_department": organization.organizationDepartment,
        "affiliation_id": organization.affiliationId
      },
      "address": address.toJson(),
      "sports": {"sport_name": "Swimming,cycling,boating"}
    };

    // Convert the request body to JSON format
    String requestBodyJson = jsonEncode(requestBody);

    // Define the request headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken',
    };
    Uri url = Uri.parse(apiUrl);
    try {
      // Make the POST request
      http.Response response = await http.post(
        url,
        headers: headers,
        body: requestBodyJson,
      );

      print("response ${response.body}");

      print('Here the token $bearerToken');
      if (response.statusCode == 201) {
        CustomMaterialBanner().show(context, "Successfull creation");
        return ResponseCreateOrganization.fromJson(jsonDecode(response.body));
      } else {
        CustomMaterialBanner().show(context, "Failed creation");
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      CustomMaterialBanner()
          .show(context, "Failed creation ${error.toString()}");
      print(error.toString());
    }
    return ResponseCreateOrganization(
      id: 0,
      legalName: '',
      telephone: '',
      orgType: '',
      organizationSport: '',
      organizationSportsId: 0,
      addressId: 0,
      affiliationId: 0,
    );
  }
}
