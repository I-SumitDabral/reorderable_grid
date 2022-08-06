import 'package:flutter/cupertino.dart';
import 'package:haicam/screens/addImage/add_new_todo_view.dart';
import 'package:haicam/screens/home/home_view.dart';

import 'app_routes.dart';

mixin Routing {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        AppRoutes.startUpRoute: ((context) => const HomeView()),
        AppRoutes.addNewImageRoute: ((context) => const AddNewTodoView()),
      };
}
