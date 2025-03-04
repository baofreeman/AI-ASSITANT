import 'package:ai_assistant/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Creator"),
        backgroundColor: Colors.white,
        elevation: 1,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey[300], height: 1),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: mq.height * .02,
          bottom: mq.height * .1,
          left: mq.width * .04,
          right: mq.width * .04,
        ),
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            minLines: 2,
            maxLines: null,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              hintText:
                  "Imaging something wonderful & innovative\n Type here & I will create for you",
              hintStyle: TextStyle(fontSize: 13.5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: mq.height * .5,
            alignment: Alignment.center,
            child: Lottie.asset(
              'assets/lottie/ai-image.json',
              height: mq.height * .3,
            ),
          ),
        ],
      ),
    );
  }
}
