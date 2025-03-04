import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NavigateTo extends CardEvent {
  final Widget page;
  NavigateTo(this.page);

  @override
  List<Object?> get props => [page];
}
