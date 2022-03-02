import 'package:mega_trust_task/models/rocket_model.dart';

import '../../../models/launchpad_model.dart';

abstract class LaunchDetailsState {}

class LaunchDetailsInitialState extends LaunchDetailsState {}

class GetLaunchDetailsLoadingState extends LaunchDetailsState {}

class GetLaunchDetailsSuccessState extends LaunchDetailsState {
  LaunchpadModel? launchpadModel;

  GetLaunchDetailsSuccessState(this.launchpadModel);
}

class GetLaunchDetailsErrorState extends LaunchDetailsState {
  final String error;

  GetLaunchDetailsErrorState(this.error);
}

class GetRocketLoadingState extends LaunchDetailsState {}

class GetRocketSuccessState extends LaunchDetailsState {
  RocketModel? rocketModel;

  GetRocketSuccessState(this.rocketModel);
}

class GetRocketErrorState extends LaunchDetailsState {
  final String error;

  GetRocketErrorState(this.error);
}
