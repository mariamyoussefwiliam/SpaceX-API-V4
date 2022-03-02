import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_task/models/launch_model.dart';
import 'package:mega_trust_task/models/launchpad_model.dart';
import 'package:mega_trust_task/modules/launchDetails/cubit/cubit.dart';
import 'package:mega_trust_task/modules/launchDetails/cubit/states.dart';
import 'package:mega_trust_task/shared/component/components.dart';
import 'package:mega_trust_task/shared/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';
class LaunchDetailsScreen extends StatelessWidget {
  final LaunchesModel model;

  const LaunchDetailsScreen({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LaunchDetailsCubit()..getLaunchpad(model.launchpad!),
      child: Scaffold(
        appBar: AppBar(
            //title: Text(model.name!),
            ),
        body: BlocConsumer<LaunchDetailsCubit, LaunchDetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = LaunchDetailsCubit.get(context);
            return ConditionalBuilder(
                condition: cubit.launchpadModel != null,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: SingleChildScrollView(
                      physics:const  BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      model.name!,
                                      style: const TextStyle(
                                          color: primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      model.dateUtc!.toString().split(" ")[0],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                TextButton( child: Text(model.links!.webcast!),onPressed: ()=>_launchURL(model.links!.webcast!),),
                              ],
                            ),
                          ),
                          Center(
                              child: Column(
                            children: [
                              buildDetails(context, cubit.launchpadModel!),
                              const Text(
                                "Rocket Data",
                                style: TextStyle(fontSize: 30),
                              ),
                              ConditionalBuilder(
                                  condition: cubit.rocketModel != null,
                                  builder: (context) => SizedBox(
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const Text(
                                                    "Height",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    "${cubit.rocketModel!.height!.meters!}",
                                                    style:
                                                        const TextStyle(fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                    "Diameter",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    "${cubit.rocketModel!.diameter!.meters!}",
                                                    style:
                                                        const TextStyle(fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                    "Mass",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    "${cubit.rocketModel!.mass!.kg!}",
                                                    style:
                                                      const  TextStyle(fontSize: 15),
                                                  ),

                                                ],
                                              ),
                                              const     SizedBox(height: 50,),
                                            ],
                                          ),
                                        ),
                                      ),
                                  fallback: (context) => myLoading(context))
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                },
                fallback: (context) => myLoading(context));
          },
        ),
      ),
    );
  }

  Widget buildDetails(context, LaunchpadModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Center(
                child: Container(
                    height: 300,
                    width: 350,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: imageFromNetwork(url: model.images!.large![0])),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          Text(
            // model.name.split(" ")[0]
            model.name!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              //   model.name,
              model.fullName!,
              style: const TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 14,
                height: 1.3,
                color: Colors.grey,
              ),
            ),
          ),
          const Divider(),
          const Text(
            "Description",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          Text(model.details!)
        ],
      ),
    );
  }
  void _launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
