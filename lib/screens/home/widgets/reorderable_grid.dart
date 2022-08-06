
import 'package:flutter/material.dart';
import 'package:haicam/screens/home/home_viewmodel.dart';
import 'package:haicam/screens/home/widgets/image_card.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class ReorderableGridWidget extends StatelessWidget {
  const ReorderableGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: ((context, value, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReorderableGridView.count(
              onReorder: value.onReorder,
              crossAxisCount: 2,
              childAspectRatio: 1,
              children: value.imageList
                  .map((image) =>
                      ImageCardWidget(key: ValueKey(image.id), image: image))
                  .toList(),
            ),
          )),
    );
  }
}
