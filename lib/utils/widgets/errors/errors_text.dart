import 'package:flutter/material.dart';

import '../../app_text_styles.dart';

Widget HeaderText({
  required String text,
  required double size,
})=>Text(
  text,
  style: AppTextStyle.regularBlack18,
  );

Widget DiscriptionText({
  required String text,
})=>Text(
  text,
  textAlign: TextAlign.center,
  style: AppTextStyle.regularBlack14,
);