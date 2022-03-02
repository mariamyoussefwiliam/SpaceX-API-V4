import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mega_trust_task/models/launch_model.dart';
import 'package:mega_trust_task/modules/launchDetails/launche_details_screen.dart';
import '../styles/colors.dart';

Widget customMaterialButton({
  required Function onPressed,
  required String text,
  bool color = true,
}) =>
    Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: color ? null : Border.all(color: primaryColor, width: 2),
        gradient: color
            ? gradientColor
            : const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
      ),
      child: Center(
        child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: color ? Colors.white : primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );

void navigatorAndRemove(context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false,
  );
}

String twoDig(int number) {
  if (number >= 10) return "$number";
  return "0$number";
}

String durationToString(Duration duration) {
  String hours = twoDig(duration.inHours.remainder(60));
  String minutes = twoDig(duration.inMinutes.remainder(60));
  String seconds = twoDig(duration.inSeconds.remainder(60));

  return "$hours:$minutes:$seconds";
}

void navigator(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Widget imageFromNetwork(
    {required String url,
    fit = BoxFit.cover,
    double height = double.infinity,
    double width = double.infinity}) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => const Image(
      image: AssetImage("assets/images/download.png"),
      width: 120,
      height: 25,
      //  fit: BoxFit,
    ),
    fit: fit,
    height: height,
    width: width,
  );
}

Widget myLoading(context) => Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/images/loading.json',
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Loading",
              style: TextStyle(
                color: primaryColor,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );

Widget buildPastLaunchItem(context, index, LaunchesModel model) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: InkWell(
      onTap: () {
        navigator(
            context,
            LaunchDetailsScreen(
              model: model,
            ));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Material(
          shadowColor: Colors.grey[300],
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.name!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                model.dateUtc.toString().split(".")[0],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
