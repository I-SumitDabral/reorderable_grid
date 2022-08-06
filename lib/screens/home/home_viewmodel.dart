import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:haicam/config/static/static_data.dart';
import 'package:haicam/models/image_model.dart';
import 'package:haicam/services/file_manager_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeViewModel extends ChangeNotifier {
  final FileManager _fileManager;
  HomeViewModel(this._fileManager);

  List<ImageModel> _imageList = [...StaticData.staticImageList];
  List<ImageModel> get imageList => _imageList;
  File? pickedFile;
  Future<void> fetchImageList() async {
    final response = await _fileManager.readJsonFile();
    if (response != null) {
      _imageList = response;
    }
    notifyListeners();
  }

  Future<void> createOrUpdateImageList([String? title]) async {
    ImageModel? image;
    if (pickedFile != null && title != null) {
      image = ImageModel(
          id: _imageList.length.toString(),
          title: title,
          image: pickedFile!.path,
          order: 0);
      for (ImageModel data in _imageList) {
        data.order++;
      }
    }

    List<ImageModel> data;
    final response = await _fileManager.readJsonFile();
    if (response == null) {
      return;
    }
    if (image != null) {
      data = [image, ...response];
    } else {
      data = [...response];
    }
    await _fileManager.writeJsonFile(data);
    notifyListeners();
  }

  Future<void> onReorder(int oldIndex, int newIndex) async {
    ImageModel image = _imageList.removeAt(oldIndex);
    _imageList.insert(newIndex, image);
    await _fileManager.writeJsonFile(_imageList);
    notifyListeners();
  }

  Future<File?> pickImage(
    bool isGallery,
  ) async {
    final result = await _fileManager.pickImage(isGallery);
    if (result != null) {
      setValue(result);
      return result;
    }
    return null;
  }

  void setValue(File? file) {
    pickedFile = file;
    notifyListeners();
  }
}
