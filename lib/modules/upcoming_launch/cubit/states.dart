import 'package:mega_trust_task/models/launch_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetUpcomingLaunchLoadingState extends HomeStates {}

class GetUpcomingLaunchSuccessState extends HomeStates {
  final LaunchesModel launchesModel;

  GetUpcomingLaunchSuccessState(this.launchesModel);
}

class GetUpcomingLaunchErrorState extends HomeStates {
  final String error;

  GetUpcomingLaunchErrorState(this.error);
}

class CountTimeState extends HomeStates {}