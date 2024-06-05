import 'dart:convert';
import 'dart:typed_data';
import 'package:squadsyncweb/common/data_of_add_users.dart';
import 'package:intl/intl.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';

class ExcelOperations {
  Future<List<List<String>>> parseExcelFile(
      Uint8List excelBytes, BuildContext context) async {
    List<List<String>> resultList = [];
    try {
      final excel = Excel.decodeBytes(excelBytes);

      // Assume we only take the first sheet
      final sheet = excel.tables.keys.first;
      final rows = excel.tables[sheet]!.rows;

      // Parse the rows
      for (var i = 0; i < rows.length; i++) {
        final row = rows[i];
        List<String> rowData = [];
        for (var j = 0; j < row.length; j++) {
          final checkTheInput = row.length - 1 == j &&
              rows[0][row.length - 1]!.value.toString() == 'dob' &&
              i > 0;
          if (checkTheInput) {
            String inputDateString = row[j]?.value?.toString() ?? '';
            DateTime inputDate = DateTime.parse(inputDateString);
            DateFormat outputFormat = DateFormat('dd/MM/yyyy');
            String formattedDate = outputFormat.format(inputDate);
            rowData.add(formattedDate);
          } else {
            rowData.add(row[j]?.value?.toString() ?? '');
          } // Convert cell value to string
        }
        resultList.add(rowData);
      }
    } catch (e) {
      CustomMaterialBanner().show(context, e.toString());
      result!.files.clear();
    }
    return resultList;
  }

  Future<Map<String, Map<String, dynamic>>> convertExcelToJson(
      Uint8List excelBytes, BuildContext context) async {
    Map<String, Map<String, dynamic>> jsonMap = {};
    try {
      final excel = Excel.decodeBytes(excelBytes);

      // Assume we only take the first sheet
      final sheet = excel.tables.keys.first;
      final rows = excel.tables[sheet]!.rows;

      // Extract column headers from the first row
      final List<String?> columnHeaders =
          List<String?>.from(rows.first.map((cell) => cell?.value?.toString()));

      // Parse the rows starting from the second row
      for (var i = 1; i < rows.length; i++) {
        final row = rows[i];
        Map<String, dynamic> rowData = {};
        for (var j = 0; j < row.length; j++) {
          final checkTheInput =
              row.length - 1 == j && columnHeaders[j] == 'dob';
          if (checkTheInput) {
            String inputDateString = row[j]?.value?.toString() ?? '';
            DateTime inputDate = DateTime.parse(inputDateString);
            DateFormat outputFormat = DateFormat('dd/MM/yyyy');
            String formattedDate = outputFormat.format(inputDate);
            rowData['dob'] = formattedDate;
          } else {
            rowData[columnHeaders[j] ?? ''] = row[j]?.value?.toString() ?? '';
          } // Convert cell value to string
        }
        jsonMap['User $i'] = rowData;
      }
    } catch (e) {
      CustomMaterialBanner().show(context, e.toString());
      result!.files.clear();
    }

    return jsonMap;
  }

  Future<List<List<String>>> parseCsvFileFromDropDragFile(
      Uint8List excelBytes, BuildContext context) async {
    String encodedString =
        utf8.decode(excelBytes); // Assuming the data is UTF-8 encoded
    List<String> items = encodedString.split('\n');
    List<List<String>> resultList = [];
    for (String item in items) {
      List<String> eachItem =
          item.split(','); // Assuming items are in key:value format
      resultList.add(eachItem);
    }
    return resultList;
  }
}
