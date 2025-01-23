import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  late String apiKey;
  late dynamic model;
  GeminiService() {
    apiKey = "AIzaSyB6g3FlOKqsOUo8K-IDhW3yCiNFJeqen9c";
    model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
  }

  Future<Map<String, dynamic>> generateContent(String prompt) async {
    try {
      return {
        'isError': false,
        'content': ((await model.generateContent([Content.text(prompt)])).text)
      };
    } catch (e) {
      return {'isError': true, 'content': 'Error Occured: ${e.toString()}'};
    }
  }
}
