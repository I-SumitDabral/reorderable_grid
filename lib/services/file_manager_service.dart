import 'dart:convert';
import 'dart:io';

import 'package:haicam/models/image_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class FileManager {
  final ImagePicker picker;

  FileManager(this.picker);

  Future<String> get _directoryPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _jsonFile async {
    final path = await _directoryPath;
    return File('$path/images.json');
  }

  Future<List<ImageModel>> writeJsonFile(List<ImageModel> images) async {
    File file = await _jsonFile;
    await file.writeAsString(json.encode(images));
    return images;
  }

  Future<List<ImageModel>?> readJsonFile() async {
    File file = await _jsonFile;
    if (await file.exists()) {
      try {
        final fileContent = await file.readAsString();
        final List decodedData = json.decode(fileContent);
        final parsedResponse =
            decodedData.map((element) => ImageModel.fromJson(element)).toList();
        return parsedResponse;
      } catch (_) {
      }
    }

    return null;
  }

  Future<File?> pickImage(bool isGallery) async {
    final result = await picker.pickImage(
        source: isGallery ? ImageSource.gallery : ImageSource.camera);
    if (result != null) {
      final File file = File(result.path);
      return file;
    }
    return null;
  }
}
