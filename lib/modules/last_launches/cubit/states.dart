import 'package:mega_trust_task/models/launch_model.dart';

abstract class LastLaunchesState {}

class LastLaunchesInitialState extends LastLaunchesState {}

class GetLastLaunchesLoadingState extends LastLaunchesState {}

class GetLastLaunchesSuccessState extends LastLaunchesState {

final  List<LaunchesModel> list;
  GetLastLaunchesSuccessState(this.list);
}

class GetLastLaunchesErrorState extends LastLaunchesState {
  final String error;

  GetLastLaunchesErrorState(this.error);
}
