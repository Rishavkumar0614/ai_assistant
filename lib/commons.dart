import 'package:flutter/material.dart';
import 'package:ai_assistant/models/user.dart';
import 'package:ai_assistant/controllers/auth_controller.dart';
// import 'package:ai_assistant/controllers/chat_controller.dart';
// import 'package:ai_assistant/services/gemini/desktop/home_screen.dart'
//     as gemini_home_screen;

enum SupportedDisplay {
  large,
  small,
  medium,
}

late SupportedDisplay? currentDisplay;
late BuildContext? currentScreenContext;

// CONTROLLERS
var authController = AuthController();
// var chatController = ChatController();

// Current User
late User user;

List<String> serviceNames = ['Gemini'];

List<ImageProvider> servicesLogo = [
  const AssetImage('assets/services logo/Gemini.png'),
];
