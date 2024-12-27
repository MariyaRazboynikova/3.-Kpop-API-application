import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpop_application/features/presentaion/widgets/button_widgets.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 40,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Women's groups",
              style: GoogleFonts.kaiseiTokumin(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Icon(
            Icons.music_note_outlined,
            color: Theme.of(context).colorScheme.secondary,
            size: 100,
          ),
          // Image.asset('lib/core/assets/love.png'),
          ButtonForInitialPage(
            text: "Start",
            onTap: () => Navigator.pushNamed(context, '/groups_page'),
          ),
        ],
      ),
    );
  }
}
