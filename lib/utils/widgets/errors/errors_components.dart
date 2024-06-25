

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/utils/app_images.dart';

import 'package:news_app/utils/widgets/errors/errors_text.dart';
import '../../app_colors.dart';
import '../buttons/default_outlined_button.dart';

Widget ConnectionProbleme({
  required Function pressed,
})=>SizedBox(
  width: 320,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 140,
        height: 140,

        decoration: BoxDecoration(
          color: AppColors.errorBg,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.errorBorder,
            width: 1,
          ),
        ),

        child: Lottie.asset(
          AppImages.connectionProbleme,
          height: 200,
          width: 200,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      HeaderText(text: 'Poor connection!',
          size: 16),
      DiscriptionText(text: 'Sorry, no internet connection found.'
          'Please Check your connection'),

      const SizedBox(height: 20,),
      DefaultOutlinedButton(
          width: 160,
          text: 'try again',
          pressed: pressed),
    ],
  ),
);

Widget NodataFound({
  required Function pressed,
})=>SizedBox(
  width: 320,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 140,
        height: 140,

        decoration: BoxDecoration(
          color: AppColors.errorBg,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.errorBorder,
            width: 1,
          ),
        ),

        child: Lottie.asset(
          AppImages.noDataFound,
          height: 200,
          width: 200,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      HeaderText(text: 'No result found!',
          size: 16),
      DiscriptionText(text: 'Sorry, No data found related to this topic.'),

      const SizedBox(height: 20,),
      DefaultOutlinedButton(
          width: 160,

          text: 'See all result',
          pressed: pressed),
    ],
  ),
);

Widget UndifinedProbleme({
  required Function pressed,
})=>Container(
  width: 320,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 140,
        height: 140,

        decoration: BoxDecoration(
          color: AppColors.errorBg,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.errorBorder,
            width: 1,
          ),
        ),

        child: Lottie.asset(
          AppImages.somthingWrong,
          height: 200,
          width: 200,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      HeaderText(text: 'Something is wrong!',
          size: 16),
      DiscriptionText(text: 'We are facing some difficulties. Try again'),

      const SizedBox(height: 20,),
      DefaultOutlinedButton(
          width: 160,
          text: 'try again',
          pressed: pressed),
    ],
  ),
);




