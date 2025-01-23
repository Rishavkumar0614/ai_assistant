import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplaySizeNotSupportedScreen extends StatelessWidget {
  const DisplaySizeNotSupportedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Screen Size Not Supported',
        style: GoogleFonts.ibmPlexSans(fontSize: 20),
      ),
    );
  }
}
