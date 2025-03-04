import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CardState extends Equatable {
  final Widget currentPage;
  const CardState(this.currentPage);

  @override
  List<Object?> get props => [currentPage];
}
