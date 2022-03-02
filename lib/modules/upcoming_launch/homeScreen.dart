import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_task/modules/upcoming_launch/cubit/cubit.dart';
import 'package:mega_trust_task/modules/upcoming_launch/cubit/states.dart';
import 'package:mega_trust_task/shared/component/components.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return SizedBox(
            width: double.infinity,
            child: ConditionalBuilder(
              condition: cubit.launchesModel != null,
              builder: (context) {
                timer = Timer.periodic(const Duration(minutes: 1), (timer) {
                  var diff = cubit.launchesModel!.dateUtc!
                      .difference(DateTime.now().toUtc());
                  cubit.countTime(diff);
                });

                return Column(
                  children: [
                    const Text(
                      "Next Launch",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    Text(
                      cubit.countDown,
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      cubit.launchesModel!.name!.toString().split(" ")[0],
                      style: const TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: imageFromNetwork(
                        url:
                            'https://media.istockphoto.com/vectors/rocket-launch-vector-illustration-isolated-on-white-vector-id876037616?k=20&m=876037616&s=612x612&w=0&h=e7ux_ivQQ_b4hhoxGOklgjxx4wl-TMWEUM1Ts-meuDo=',
                      ),
                    )
                  ],
                );
              },
              fallback: (context) => myLoading(context),
            ),
          );
        });
  }
}
