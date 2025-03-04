import 'package:ai_assistant/bloc/chat/chat_bloc.dart';
import 'package:ai_assistant/bloc/chat/chat_event.dart';
import 'package:ai_assistant/bloc/chat/chat_state.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:ai_assistant/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      context.read<ChatBloc>().add(
        SendMessage(Message(msg: _controller.text, msgType: MessageType.user)),
      );
      _controller.clear();
      Future.delayed(Duration(milliseconds: 100), () {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat bot"),
        backgroundColor: Colors.white,
        elevation: 1,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey[300], height: 1),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                focusNode: _focusNode,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  hintText: "Ask me anything you want...",
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                onFieldSubmitted: (value) => _sendMessage(),
              ),
            ),
            SizedBox(width: 8),
            CircleAvatar(
              radius: 24,
              child: IconButton(
                onPressed: _sendMessage,
                icon: Icon(
                  Icons.rocket_launch_rounded,
                  color: Colors.blue,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocListener<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is ChatLoaded) {
            _scrollToBottom();
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is ChatLoaded) {
                return ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.only(
                    top: mq.height * .02,
                    bottom: mq.height * .1,
                  ),
                  physics: BouncingScrollPhysics(),
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: MessageCard(message: state.messages[index]),
                    );
                  },
                );
              }
              return Center(child: Text("Send a message"));
            },
          ),
        ),
      ),
    );
  }
}
