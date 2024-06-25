
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/app_text_styles.dart';

import '../../app_colors.dart';


class SearchField extends StatefulWidget {
  final TextEditingController contoller;
  final TextInputType type;
  IconData? prefix;
  final String label;
  final Function clear;
   final Function change;


  SearchField({super.key, required this.contoller, required this.type,
    required this.label,this.prefix, required this.change, required this.clear,
    });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  Color color = AppColors.primary;


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onTapOutside: (event){
          FocusManager.instance.primaryFocus!.unfocus();
        },
        onChanged: (value){
          widget.change(value);
        },

        maxLines: 1,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        scrollPadding: EdgeInsets.zero,
        cursorHeight: 20,
        controller: widget.contoller ,
        keyboardType: widget.type,





        style: GoogleFonts.poppins(
          fontSize: 14,
          color: AppColors.black,),



        cursorColor: color ,
        decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          hintText: widget.label,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 1.0,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
                color: AppColors.grey,
                width: 1
            ),
          ),


          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10.0),
          //   borderSide: BorderSide(
          //     color: redColor,
          //     width: 2.0,
          //   ),
          // ),






          prefixIcon:const Icon(Icons.search,
          size: 25,),

          suffixIcon: TextButton(
            onPressed: (){
              widget.clear();

      },
        child: Text('Clear',
          style: AppTextStyle.boldPrimary12,),
      ),



        ),
      ),
    );
  }
}
