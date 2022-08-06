import 'package:flutter/material.dart';
import 'package:haicam/screens/home/home_viewmodel.dart';
import 'package:haicam/screens/home/widgets/reorderable_grid.dart';
import 'package:provider/provider.dart';

import 'widgets/bottom_navbar_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel homeViewModel;
  @override
  void initState() {
    homeViewModel = context.read<HomeViewModel>();
    homeViewModel.createOrUpdateImageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: BottomNavBarWidget(),
        body: ReorderableGridWidget());
  }
}
