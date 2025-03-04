import 'package:ai_assistant/model/message.dart';
import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendMessage extends ChatEvent {
  final Message message;

  SendMessage(this.message);

  @override
  List<Object> get props => [message];
}
