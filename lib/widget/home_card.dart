import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.withOpacity(.2),
      elevation: 0,
      margin: EdgeInsets.only(bottom: mq.height * .02),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: InkWell(
        onTap: () => homeType.onTap(context)(),
        child:
            homeType.leftAlign
                ? Row(
                  children: [
                    Lottie.asset(
                      'assets/lottie/${homeType.lottie}.json',
                      width: mq.width * .35,
                    ),
                    Spacer(),
                    Text(
                      homeType.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                )
                : Row(
                  children: [
                    Spacer(),
                    Text(
                      homeType.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                    Spacer(flex: 2),
                    Lottie.asset(
                      'assets/lottie/${homeType.lottie}.json',
                      width: mq.width * .35,
                    ),
                  ],
                ),
      ),
    );
  }
}
