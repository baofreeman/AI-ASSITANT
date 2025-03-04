import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ai_assistant/model/onboard.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});
  final c = PageController();
  final list = [
    Onboard(
      title: "Ask me Anything",
      subtitle:
          "I can't be your Best Friend & You can aske me anything & I will help you!",
      lottie: "ai-analysis",
    ),
    Onboard(
      title: "Imagination",
      subtitle:
          "Just Imagine anything & let me know, I will create something wonderful for you!",
      lottie: 'ai-play',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length - 1;

          return Center(
            child: Column(
              children: [
                Lottie.asset(
                  "assets/lottie/${list[ind].lottie}.json",
                  height: mq.height * .6,
                  width: isLast ? mq.width * .7 : null,
                ),
                Text(
                  list[ind].title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .5,
                  ),
                ),

                SizedBox(height: mq.height * .015),

                SizedBox(
                  width: mq.width * .8,
                  child: Text(
                    list[ind].subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.5,
                      letterSpacing: .5,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Spacer(),

                Wrap(
                  spacing: 10,
                  children: List.generate(
                    list.length,
                    (i) => Container(
                      width: i == ind ? 15 : 10,
                      height: 8,
                      decoration: BoxDecoration(
                        color: i == ind ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    elevation: 0,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    minimumSize: Size(mq.width * .4, 50),
                  ),
                  onPressed: () {
                    if (isLast) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                      );
                    } else {
                      c.nextPage(
                        duration: Duration(microseconds: 1500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(isLast ? "Finish" : 'Next'),
                ),
                Spacer(flex: 2),
              ],
            ),
          );
        },
      ),
    );
  }
}
