import 'package:ai_assistant/api/api.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc()
    : super(
        ChatLoaded([
          Message(
            msg: "Hello! How can I assist you today?",
            msgType: MessageType.bot,
          ),
        ]),
      ) {
    on<SendMessage>(_onSendMessage);
  }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    if (state is! ChatLoaded) return;
    final List<Message> updatedMessages =
        state is ChatLoaded ? List.from((state as ChatLoaded).messages) : [];

    updatedMessages.add(event.message);
    updatedMessages.add(Message(msg: "", msgType: MessageType.bot));
    emit(ChatLoaded(List.from(updatedMessages)));

    try {
      final botResponse = await API.getAnswer(event.message.msg);
      final botMessage = Message(
        msg: botResponse ?? "Sorry, I couldn't fetch a response.",
        msgType: MessageType.bot,
      );
      updatedMessages.removeLast();
      updatedMessages.add(botMessage);
      emit(ChatLoaded(List.from(updatedMessages)));
    } catch (e) {
      updatedMessages.removeLast();
      updatedMessages.add(
        Message(msg: "Error fetching response.", msgType: MessageType.bot),
      );
    }

    emit(ChatLoaded(List.from(updatedMessages)));
  }
}
