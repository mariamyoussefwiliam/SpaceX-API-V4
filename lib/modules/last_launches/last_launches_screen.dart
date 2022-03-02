import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_task/modules/last_launches/cubit/cubit.dart';
import 'package:mega_trust_task/modules/last_launches/cubit/states.dart';

import '../../shared/component/components.dart';

class LastLaunchesScreen extends StatelessWidget {
  const LastLaunchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LastLaunchesCubit, LastLaunchesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LastLaunchesCubit.get(context);
          return SingleChildScrollView(
            child: ConditionalBuilder(
              condition: cubit.list.isNotEmpty,
              builder: (context) => Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 1),
                  ),
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => buildPastLaunchItem(context,index,cubit.list[index]),
                        itemCount: cubit.list.length,
                        separatorBuilder: (context, index) => Container(
                          height: 1,
                          color: Colors.black12,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              fallback: (context) => myLoading(context),
            ),
          );
        });
  }
}
