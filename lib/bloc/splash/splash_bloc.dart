import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/bloc/splash/splash_event.dart';
import 'package:parking_app/bloc/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SetSplash>((event, emit) async {
      emit(SplashLoadingState());
      await Future.delayed(const Duration(seconds: 3));
      emit(SplashLoadedState());
    });
  }
}
