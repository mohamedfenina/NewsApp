
import 'package:flutter/material.dart';

import 'package:news_app/utils/app_text_styles.dart';

import '../../app_colors.dart';


class DefaultOutlinedButton extends StatefulWidget {
  final Color containerColor ;
  final String text ;
  final Function pressed;
  final double width;
  final double raduis;
  const DefaultOutlinedButton({super.key,
    this.containerColor = AppColors.primary,
    required this.text,
    required this.pressed,
     this.width = double.infinity,
     this.raduis = 6,


  });


  @override
  State<DefaultOutlinedButton> createState() => _DefaultOutlinedButtonState();
}

class _DefaultOutlinedButtonState extends State<DefaultOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: widget.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(widget.raduis),
        border: Border.all(
          color: widget.containerColor,
          width: 1,
        ),
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
          style: AppTextStyle.boldPrimary16,),
      ),
    );
  }
}
