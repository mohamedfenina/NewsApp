import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:news_app/screens/web_view_screen.dart';
import 'package:news_app/utils/widgets/buttons/default_button.dart';
import 'package:news_app/utils/widgets/buttons/default_outlined_button.dart';
import 'package:share_plus/share_plus.dart';

import '../models/post_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key, required this.data});
  final PostModel data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body:Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.45,
                  width: double.infinity,
                  child: Image.network(
                    data.image,
                    fit: BoxFit.cover,
                    // Replace the above URL with your actual image URL
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return  Center(
                        child: Text('problem in image',
                            style: AppTextStyle.boldBlack18),
                      );
                    },
                  ),
                ),
                Positioned(
                  top:25,
                    left: 20,
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.all(0),
                      icon: Container(
                        padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.grey.withOpacity(0.4),
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,color: AppColors.white,size: 30,),
                          )),
                    )),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.45,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(top: 10),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  
                                  backgroundColor: AppColors.grey.withOpacity(0.6),
                                  radius: 25,
                                  child: Text(
                                    data.newsSite[0],
                                    style: AppTextStyle.regularWhite24,
                                  ),
      
                                ),
                                SizedBox(width: 20,),
                                Text(data.newsSite,
                                  style: AppTextStyle.boldBlack22,),
                                Spacer(),
                                Text(data.publishedAt,
                                  style: AppTextStyle.regularGrey14,),
      
                              ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(data.title,
                              style: AppTextStyle.boldBlack22,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(data.summary,
                              style: AppTextStyle.regularBlack16,
                              maxLines: 3,),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
      
            ),
      
      
      
      
      
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.white,
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 20),
      
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DefaultOutlinedButton(
                    text: 'Share Link', pressed: () async {
                  Share.share(data.url, subject: 'Check out this news!');
      
                }),
              ),
              SizedBox(width: 20,),
      
              Expanded(
                child: DefaultButton(
                  width: 200,
                    text: 'Visit Website',
                    pressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(url: data.url, name: data.newsSite,)));
      
                    }),
              )
      
            ],
          ),
        )
      ),
    );
  }
}
