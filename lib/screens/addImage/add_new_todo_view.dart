import 'package:flutter/material.dart';
import 'package:haicam/config/extensions/context_extensions.dart';
import 'package:haicam/screens/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class AddNewTodoView extends StatefulWidget {
  const AddNewTodoView({Key? key}) : super(key: key);

  @override
  State<AddNewTodoView> createState() => _AddNewTodoViewState();
}

class _AddNewTodoViewState extends State<AddNewTodoView> {
  late final TextEditingController titleController;
  late final HomeViewModel _homeViewModel;

  @override
  void initState() {
    _homeViewModel = context.read<HomeViewModel>();
    titleController = TextEditingController(text: getFileName(context));
    super.initState();
  }

  String? getFileName(BuildContext context) {
    return _homeViewModel.pickedFile?.path.split("/").last;
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            _imageWidget,
            SizedBox(
              height: context.h / 20,
            ),
            _textField(context),
            SizedBox(
              height: context.h / 20,
            ),
            _buttons
          ],
        ),
      ),
    );
  }

  Widget get _buttons {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () => context.pop, child: const Text("Cancel")),
        SizedBox(
          width: context.w / 8,
        ),
        ElevatedButton(
            onPressed: () => _homeViewModel
                .createOrUpdateImageList(titleController.text)
                .then((value) => _homeViewModel
                    .fetchImageList()
                    .then((value) => context.pop)),
            child: const Text("\tsave\t")),
      ],
    );
  }

  Widget get _imageWidget {
    return Consumer<HomeViewModel>(builder: ((context, value, child) {
      if (value.pickedFile != null) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Image.file(
                value.pickedFile!,
                height: context.h / 4,
                width: context.w / 2,
                fit: BoxFit.contain,
              ),
            ),
          ],
        );
      }
      return const SizedBox.shrink();
    }));
  }

  Widget _textField(BuildContext context) {
    return TextField(
      controller: titleController,
      decoration: const InputDecoration(
          labelText: "title",
          border:  OutlineInputBorder(),
          enabledBorder:  OutlineInputBorder()),
    );
  }
}
