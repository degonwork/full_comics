import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_comics/root_app/bottombar_bloc/bottombar_event.dart';
import 'package:full_comics/root_app/bottombar_bloc/bottombar_state.dart';

class BottombarBloc extends Bloc<BottombarEvent,BottombarState> {
  BottombarBloc() : super(const BottombarState()){
    on<ChangeBottombarEvent>(_onChangeBottombarState);
  }
  void _onChangeBottombarState(ChangeBottombarEvent event,Emitter<BottombarState> emit){
    try {
      emit(BottombarState(currentScreen: event.currentScreen));
    } catch (e) {
      emit(ChangeBottombarError());
    }
  }
}