import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_task/models/launch_model.dart';
import 'package:mega_trust_task/modules/last_launches/cubit/states.dart';
import 'package:mega_trust_task/shared/network/end_points.dart';
import '../../../shared/network/remote/dio-helper.dart';

class LastLaunchesCubit extends Cubit<LastLaunchesState> {
  LastLaunchesCubit() : super(LastLaunchesInitialState());

  static LastLaunchesCubit get(context) => BlocProvider.of(context);

  List<LaunchesModel> list = [];

  void getPastLaunches() {
    emit(GetLastLaunchesLoadingState());
    DioHelper.getData(url: pastLaunches).then((value) {
      //print(value.data);
      value.data.forEach(
        (element) => list.add(LaunchesModel.fromJson(element)),
      );
      // print(list.toString());
      emit(GetLastLaunchesSuccessState(list));
    }).catchError((error) {
      //   print("error ${error.toString()}");
      // print(error.toString());
      emit(GetLastLaunchesErrorState(error.toString()));
    });
  }
}
