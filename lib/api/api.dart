import 'dart:convert';
import 'dart:io';
import 'package:ai_assistant/helper/global.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<String?> getAnswer(String question) async {
    try {
      final response = await http.post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "gpt-4o",
          "temperature": 0,
          "messages": [
            {"role": "user", "content": question},
          ],
        }),
      );

      if (response.statusCode != 200) {
        print('API Error: ${response.statusCode}');
        print('Response: ${response.body}');
        return null;
      }

      final data = jsonDecode(response.body);
      print(data["choices"][0]["message"]["content"]);
      return data["choices"][0]["message"]["content"];
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
