import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const appName = 'AI Assistant';

late Size mq;

String apiKey = dotenv.env['OPENAI_API_KEY'] ?? '';
