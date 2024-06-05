import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

List<List<String>> listOfRows = [];

int successful = 0;

int failed = 0;

FilePickerResult? result;

late Uint8List excelData;

String responseMessage = '';
