import 'package:flutter/material.dart';
import 'package:haicam/config/extensions/context_extensions.dart';
import 'package:haicam/config/routing/app_routes.dart';
import 'package:haicam/screens/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _iconButton("Image", () => setButtonCallback(context, true)),
          _iconButton("Camera ", () => setButtonCallback(context, false)),
        ],
      ),
    );
  }

  void setButtonCallback(BuildContext context, bool isGallery) {
    context.read<HomeViewModel>().pickImage(isGallery).then((value) {
      if (value != null) {
        context.push(AppRoutes.addNewImageRoute);
      }
    });
  }

  Widget _iconButton(String title, VoidCallback onPressed) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ));
  }
}
