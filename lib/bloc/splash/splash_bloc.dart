import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper/pre.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<CheckOnboardingEvent>(_onCheckOnboarding);
  }

  Future<void> _onCheckOnboarding(
    CheckOnboardingEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));

    if (Pre.showOnboarding) {
      emit(SplashNavigateToOnboarding());
    } else {
      emit(SplashNavigateToHome());
    }
  }
}
