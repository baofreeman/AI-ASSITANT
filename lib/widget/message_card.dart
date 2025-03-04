import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);
    final bool isUserMessage = message.msgType == MessageType.user;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isUserMessage)
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Image.asset("assets/images/logo.png"),
          ),

        SizedBox(width: 8),

        Container(
          constraints: BoxConstraints(maxWidth: mq.width * .8),
          margin: EdgeInsets.only(
            bottom: mq.height * .02,
            right: mq.width * .02,
          ),
          padding: EdgeInsets.symmetric(
            vertical: mq.height * .01,
            horizontal: mq.width * .02,
          ),
          decoration: BoxDecoration(
            color: isUserMessage ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: r,
              topRight: r,
              bottomLeft: isUserMessage ? r : Radius.zero,
              bottomRight: isUserMessage ? Radius.zero : r,
            ),
          ),

          child:
              message.msg.isEmpty
                  ? AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Please wait...',
                        speed: Duration(milliseconds: 100),
                      ),
                    ],

                    repeatForever: true,
                  )
                  : Text(
                    message.msg,
                    style: TextStyle(
                      color: isUserMessage ? Colors.white : Colors.black,
                    ),
                  ),
        ),

        SizedBox(width: 8),
        if (isUserMessage)
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Image.asset("assets/images/user.png"),
          ),
      ],
    );
  }
}
