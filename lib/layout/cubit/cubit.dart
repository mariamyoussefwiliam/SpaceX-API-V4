
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_task/layout/cubit/states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitLayoutCubit());

  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;

  changeBottomNavigationBarIndex(index)
  {
    currentIndex=index;
    emit(AppChangeBottomNavBarState());
  }


}
