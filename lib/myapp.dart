import 'package:flutter/material.dart';
import 'package:haicam/config/routing/app_routes.dart';
import 'package:haicam/config/routing/routing.dart';
import 'package:haicam/injection/locator.dart';
import 'package:haicam/screens/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'config/routing/page_transitions.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: ((context) => getIt<HomeViewModel>()..fetchImageList()))
      ],
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.startUpRoute,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: (RouteSettings settings) {
          final routes = Routing.getRoutes(settings);
          final WidgetBuilder? builder = routes[settings.name];
          return FadePageRouteBuilder(
            builder: builder!,
            settings: settings,
          );
        },
      ),
    );
  }
}
