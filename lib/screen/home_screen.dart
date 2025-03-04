import 'package:ai_assistant/api/api.dart';
import 'package:ai_assistant/bloc/card/card_bloc.dart';
import 'package:ai_assistant/bloc/card/card_state.dart';
import 'package:ai_assistant/helper/pre.dart';
import 'package:ai_assistant/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helper/global.dart';
import 'package:ai_assistant/widget/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pre.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    API.getAnswer("hi");

    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        print("UI rebuild with state: ${state.currentPage}");
        return Scaffold(
          appBar: AppBar(
            title: Text(
              appName,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            elevation: 1,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.brightness_4_rounded,
                  color: Colors.blue,
                  size: 26,
                ),
              ),
            ],
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * .04,
              vertical: mq.height * .015,
            ),
            children:
                HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
          ),
        );
      },
    );
  }
}
