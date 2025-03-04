import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/splash/splash_bloc.dart';
import 'home_screen.dart';
import 'onboarding.dart';
import '../widget/custom_loading.dart';
import '../helper/global.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (_) => SplashBloc()..add(CheckOnboardingEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToOnboarding) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Onboarding()),
            );
          } else if (state is SplashNavigateToHome) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          }
        },
        child: Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Spacer(flex: 2),
                Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: mq.width * .45,
                  ),
                ),
                Spacer(),
                CustomLoading(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
