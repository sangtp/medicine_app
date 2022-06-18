import 'package:flutter/material.dart';
import '../screens/main_page.dart';

import '../widgets/general_logo_space.dart';
import '../widgets/button_primary.dart';
import '../widgets/widget_illustration.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralLogoSpace(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            WidgetIllustration(
              image: 'assets/images/splash_illustration.png',
              title: 'Find your medical\nsolution',
              subtitle1: 'Consult with a doctor',
              subtitle2: 'whereever and whenever you want',
              child: ButtonPrimary(
                text: 'GET STARTED',
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MainPages()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
