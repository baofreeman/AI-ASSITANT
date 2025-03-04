import 'package:ai_assistant/features/chatbot_feature.dart';
import 'package:ai_assistant/features/image_feature.dart';
import 'package:ai_assistant/features/translator_feature.dart';
import 'package:flutter/material.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  String get title => switch (this) {
    HomeType.aiChatBot => "AI ChatBot",
    HomeType.aiImage => "AI Image Creator",
    HomeType.aiTranslator => "Language Translator",
  };

  String get lottie => switch (this) {
    HomeType.aiChatBot => "ai-play",
    HomeType.aiImage => "ai-image",
    HomeType.aiTranslator => "ai-translator",
  };

  bool get leftAlign => switch (this) {
    HomeType.aiChatBot => false,
    HomeType.aiImage => true,
    HomeType.aiTranslator => false,
  };

  VoidCallback onTap(BuildContext context) {
    return () {
      print("HomeType tapped: $this");

      switch (this) {
        case HomeType.aiChatBot:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatbotFeature()),
          );
          break;
        case HomeType.aiImage:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ImageFeature()),
          );
          break;
        case HomeType.aiTranslator:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TranslatorFeature()),
          );
          break;
      }
    };
  }
}
