import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_assistant/views/screens/responsive_screen.dart';
import 'package:ai_assistant/views/screens/mobile/onboarding_screen.dart';
import 'package:ai_assistant/views/screens/tablet/onboarding_screen.dart';
import 'package:ai_assistant/views/screens/desktop/onboarding_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Assistant',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      home: ResponsiveScreen(
        tabScreen: TabletOnBoardingScreen(),
        mobileScreen: MobileOnBoardingScreen(),
        desktopScreen: DesktopOnBoardingScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
