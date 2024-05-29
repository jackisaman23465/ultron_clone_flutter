import 'package:bloc/bloc.dart';

import 'bloc_state.dart';

class MoreFunction extends BlocDataState {}

class MoreFunctionAtTop extends BlocDataState {}

class HomeFunctionAtTop extends BlocDataState {}

class GoAddNewAutomatedScenarioPage extends BlocDataState {}

class MainCubit extends Cubit<BlocDataState> {
  MainCubit() : super(Init());

  void showMoreFunction(int selectedPageIndex) {
    if(selectedPageIndex == 0){
      emit(MoreFunction());
    }else{
      emit(GoAddNewAutomatedScenarioPage());
    }
  }

  void showMoreFunctionAtTop() {
    emit(MoreFunctionAtTop());
  }

  void showHomeFunctionAtTop() {
    emit(HomeFunctionAtTop());
  }

  void init() {
    emit(Init());
  }
}
