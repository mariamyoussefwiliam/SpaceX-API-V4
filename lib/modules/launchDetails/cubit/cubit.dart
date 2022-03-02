import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_task/models/launch_model.dart';
import 'package:mega_trust_task/models/launchpad_model.dart';
import 'package:mega_trust_task/models/rocket_model.dart';
import 'package:mega_trust_task/modules/last_launches/cubit/states.dart';
import 'package:mega_trust_task/modules/launchDetails/cubit/states.dart';
import 'package:mega_trust_task/shared/network/end_points.dart';
import '../../../shared/network/remote/dio-helper.dart';

class LaunchDetailsCubit extends Cubit<LaunchDetailsState> {
  LaunchDetailsCubit() : super(LaunchDetailsInitialState());

  static LaunchDetailsCubit get(context) => BlocProvider.of(context);
  LaunchpadModel? launchpadModel;

  void getLaunchpad(String id) {
    emit(GetLaunchDetailsLoadingState());
    DioHelper.getData(url: "$launchpad/$id").then((value) {
      //print(value.data);
      launchpadModel = LaunchpadModel.fromJson(value.data);
      getRockedData(launchpadModel!.rockets![0]);
      emit(GetLaunchDetailsSuccessState(launchpadModel));
    }).catchError((error) {
      print(error.toString());
      emit(GetLaunchDetailsErrorState(error.toString()));
    });
  }

  RocketModel? rocketModel;

  void getRockedData(String id) {
    emit(GetRocketLoadingState());
    DioHelper.getData(url: "$rockets/$id").then((value) {
      print(value.data);
      rocketModel = RocketModel.fromJson(value.data);
      emit(GetRocketSuccessState(rocketModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetRocketErrorState(error.toString()));
    });
  }
}
