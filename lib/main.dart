import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_task/layout/home_layout.dart';
import 'package:mega_trust_task/modules/last_launches/cubit/cubit.dart';
import 'package:mega_trust_task/modules/upcoming_launch/cubit/cubit.dart';
import 'package:mega_trust_task/shared/network/remote/dio-helper.dart';
import 'package:mega_trust_task/shared/observer.dart';
import 'package:mega_trust_task/shared/styles/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "launch rocket",
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      themeMode: ThemeMode.light,
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getUpcomingLaunch(),
        ),
        BlocProvider(
          create: (context) => LastLaunchesCubit()..getPastLaunches(),
        ),
      ], child: const HomeLayout()),
    );
  }
}
