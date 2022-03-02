import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_task/layout/cubit/cubit.dart';
import 'package:mega_trust_task/layout/cubit/states.dart';
import 'package:mega_trust_task/modules/upcoming_launch/homeScreen.dart';

import '../modules/last_launches/last_launches_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      const LastLaunchesScreen(),
    ];
    List<Widget> titles = const [
      Text("SpaceX Launch Tracker"),
      Text("List of Past Launches")
    ];
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = LayoutCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: titles[cubit.currentIndex],
                centerTitle: true,
              ),
              body: screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  LayoutCubit.get(context)
                      .changeBottomNavigationBarIndex(index);
                },
                currentIndex: LayoutCubit.get(context).currentIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: "Past Launches"),
                ],
              ),
            );
          }),
    );
  }
}
