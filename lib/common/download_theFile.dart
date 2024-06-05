import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';

class DownloadTheFile {
  Future<void> download(
      {required Map<String, Map<String, dynamic>> jsonFormateData,
      required BuildContext context}) async {
    try {
      // Convert the map into a JSON string
      String jsonString = '{';
      jsonFormateData.forEach((key, value) {
        jsonString += '"$key": ${jsonEncode(value)}, ';
      });
      jsonString =
          jsonString.substring(0, jsonString.length - 2); // Remove extra comma
      jsonString += '}';

      final bytes = utf8.encode(jsonString);
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = 'example.json';

      html.document.body!.children.add(anchor);
      anchor.click();

      html.Url.revokeObjectUrl(url);
    } catch (e) {
      CustomMaterialBanner().show(context, e.toString());
    }
  }
}
