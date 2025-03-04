import 'package:ai_assistant/bloc/card/card_event.dart';
import 'package:ai_assistant/bloc/card/card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardState(Container())) {
    on<NavigateTo>((event, emit) {
      print("Navigating to: ${event.page}");
      emit(CardState(event.page));
    });
  }
}
