import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:squadsyncweb/data/model/org_id.dart';

class RetrieveingOrgList {
  // Import the data classes defined above

  Future<List<OrgId>> fetchOrganizations(String bearerToken) async {
    // Define the API URL
    String apiUrl =
        'https://squadsync-backend.azurewebsites.net/api/v0.1/organization/organizations-list';
    print(bearerToken);
    // Define the request headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken',
    };

    try {
      // Make the GET request
      http.Response response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        print('Organizations fetched successfully!');
        print('Response body: ${response.body}');

        // Parse the response body
        List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse
            .map((json) => OrgId(
                id: json['id'] ?? 0,
                orgIdName: json['Organization_name'] ?? 'null'))
            .toList();
      } else {
        print(
            'Failed to fetch organizations. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return [];
      }
    } catch (error) {
      print('Error fetching organizations: $error');
      return [];
    }
  }
}
