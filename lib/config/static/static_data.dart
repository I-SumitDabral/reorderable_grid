import 'package:haicam/models/image_model.dart';

class StaticData {
  StaticData._();

  static List<ImageModel> staticImageList = [
    ImageModel(
        id: "0", title: "first_image", image: "assets/images/1.jpg", order: 0),
    ImageModel(
        id: "1", title: "second_image", image: "assets/images/2.jpg", order: 1),
    ImageModel(
        id: "2", title: "third_image", image: "assets/images/3.jpg", order: 2),
    ImageModel(
        id: "3", title: "fourth_image", image: "assets/images/4.jpg", order: 3)
  ];
}
