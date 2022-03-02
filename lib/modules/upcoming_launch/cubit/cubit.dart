import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_task/models/launch_model.dart';
import 'package:mega_trust_task/modules/upcoming_launch/cubit/states.dart';
import 'package:mega_trust_task/shared/component/components.dart';
import 'package:mega_trust_task/shared/network/end_points.dart';
import '../../../shared/network/remote/dio-helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  LaunchesModel? launchesModel;

  void getUpcomingLaunch() {
    emit(GetUpcomingLaunchLoadingState());
    DioHelper.getData(url: upcomingLaunches).then((value) {
      launchesModel = LaunchesModel.fromJson(value.data[0]);
      //print(value.data[0]);
      print(value.data[0]['name'].toString().split(" ")[0]);
      print(value.data[0]['date_utc'].toString());
      emit(GetUpcomingLaunchSuccessState(launchesModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetUpcomingLaunchErrorState(error.toString()));
    });
  }

  String countDown = "";

  void countTime(diff) {
    countDown = durationToString(diff);
    emit(CountTimeState());
  }
}
