
import 'package:flutter/material.dart';

import 'package:news_app/utils/app_text_styles.dart';

import '../../app_colors.dart';


class DefaultButton extends StatefulWidget {
  final Color containerColor ;
  final String text ;
  final Function pressed;
  final double width;
  const DefaultButton({super.key,
     this.containerColor = AppColors.primary,
     required this.text,
     required this.pressed,
   this.width = double.infinity});


  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: widget.containerColor.withOpacity(0.1),
            spreadRadius: -10,
            blurRadius: 40,
            offset: const Offset(0, 25), // changes position of shadow
          ),
        ],
      ),

      child: TextButton(onPressed: (){
          widget.pressed();
      },
        child: Text(widget.text,
          style: AppTextStyle.boldWhite16),
      ),
    );
  }
}
