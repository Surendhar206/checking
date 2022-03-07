import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

abstract class LocalizationRepository {
  late Map<String, dynamic> localization;
  late Map<String, dynamic> customLocalization;

  String getLocalization(String key) {
    if (customLocalization.containsKey(key)) return customLocalization[key];
    if (localization.containsKey(key)) return localization![key];
    return "UnknownLetter";
  }

  void saveCustomLocalization(Map<String, dynamic> customLocalization);
}

class LocalizationRepositoryImpl extends LocalizationRepository {
  final dynamic defaultString;
  late final dynamic customString;

  LocalizationRepositoryImpl(
    String s, {
    this.defaultString,
    this.customString,
  });

  @override
  Map<String, dynamic> get localization {
    var data = json.decode(defaultString);
    return data;
  }

  @override
  Map<String, dynamic> get customLocalization {
    if (customString != null) {
      var data = json.decode(customString);
      return data;
    }
    return Map<String, dynamic>();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/custom_localization.json');
  }

  Future<File> writeLocalization(String localeJson) async {
    final file = await _localFile;
    // Write the file.
    return file.writeAsString(localeJson);
  }

  Future<String> readLocalization() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0.
      return "";
    }
  }

  @override
  void saveCustomLocalization(Map<String, dynamic> customLocalization) async {
    var jsonString = json.encode(customLocalization);
    await writeLocalization(jsonString);
    customString = jsonString;
  }
}
