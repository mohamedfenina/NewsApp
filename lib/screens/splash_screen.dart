import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/post_screen.dart';
import 'package:news_app/utils/app_images.dart';
import 'package:news_app/utils/app_text_styles.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      AnimatedSplashScreen(


        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.appLogo,
              height: MediaQuery.sizeOf(context).width/2,
              width: MediaQuery.sizeOf(context).width/2,
            fit: BoxFit.cover,),
            const SizedBox(
              height: 30,
            ),
            Text('News App',
                style: AppTextStyle.boldPrimary24
            ),
          ],
        ),
        nextScreen: PostScreen(),
        splashIconSize: 3000,
        duration: 2500,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.topToBottom,
        animationDuration: const Duration(seconds: 2),
      ),

    );
  }
}
