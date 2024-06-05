import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:squadsyncweb/common/data_of_add_users.dart';
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';

class UploadingFile {
  Future<bool> uploadFileForAthletes(FilePickerResult filePickerResult,
      BuildContext context, String token) async {
    if (filePickerResult.files.first.name.toLowerCase().endsWith('.csv')) {
      try {
        print(filePickerResult.files.first.name);
        var request = http.MultipartRequest(
            'POST',
            Uri.parse(
                'https://squadsync-backend.azurewebsites.net/api/v0.1/bulk_upload/bulk_upload_athletes'));
        request.files.add(await http.MultipartFile.fromBytes(
            'file', filePickerResult.files.first.bytes!,
            filename: filePickerResult.files.first.name,
            contentType: MediaType('text', 'csv')));
        request.headers['Authorization'] = 'Bearer $token';
        // request.headers['Content-Type'] = 'multipart/form-data';
        var response = await request.send();

        var responseBody = await http.Response.fromStream(response);
        print('Response status: ${response.statusCode}');
        print('Response body: ${responseBody.body}');

        if (response.statusCode == 201) {
          var responseJson = jsonDecode(responseBody.body);
          responseMessage = responseJson['successfulUploads'].length == 0
              ? "No Athletes Uploaded"
              : "Uploaded Successfully";
          CustomMaterialBanner().show(context, "Uploaded Successfully");
          print('File uploaded successfully!');
          return true;
        } else if (response.statusCode == 400) {
          var responseJson = jsonDecode(responseBody.body);
          var existingAthletes =
              List<String>.from(responseJson['detail']['existing_athletes']);
          print('Existing athletes: $existingAthletes');
          CustomMaterialBanner().show(context,
              "File upload failed: Some athletes already exist. ${existingAthletes.join(', ')}");
          responseMessage = responseJson['detail']['message'].toString();

          print('File upload failed with status: ${response.statusCode}');
          print(response.headers); // This might contain error details
          return false;
        } else {
          CustomMaterialBanner().show(context,
              "File upload failed with status: ${response.statusCode}");
          print('File upload failed with status: ${response.statusCode}');
          print(response.headers); // This might contain error details
          return false;
        }
      } catch (e) {
        print(e.toString());
        return false;
      }
    } else {
      // Show an error message to the user indicating a CSV file is required
      CustomMaterialBanner().show(context, "Please select a CSV file");
      return false;
    }
  }

  // Future<void> uploadFileForHEadCoach(
  //     String filePath, BuildContext context, String token) async {
  //   var request = http.MultipartRequest(
  //     'POST',
  //     Uri.parse(
  //         'https://squadsync-backend.azurewebsites.net/api/v0.1/bulk_upload/bulk_upload_head_coach'),
  //   );
  //   request.headers['Authorization'] = 'Bearer $token';
  //   request.files.add(await http.MultipartFile.fromPath('file', filePath));

  //   var response = await request.send();

  //   if (response.statusCode == 200) {
  //     print('File uploaded successfully!');
  //   } else {
  //     print('File upload failed with status: ${response.statusCode}');
  //   }
  // }
}
