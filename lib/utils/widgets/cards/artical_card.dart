
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/post_model.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_text_styles.dart';

import '../../../screens/post_detail_screen.dart';

class ArticalCard extends StatefulWidget {
  const ArticalCard({super.key, required this.data});

  final PostModel data;


  @override
  _ArticalCardState createState() => _ArticalCardState();
}

class _ArticalCardState extends State<ArticalCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailScreen(
                    data: widget.data,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20,left: 20,top: 20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      CircleAvatar(
                         backgroundColor: AppColors.grey.withOpacity(0.5),
                        child: Text(
                          widget.data.newsSite[0],
                          style: AppTextStyle.regularWhite22,
                        ),
          
                      ),
                      SizedBox(width: 5,),
                      Text(widget.data.newsSite,
                      style: AppTextStyle.boldBlack18,),
                        SizedBox(width: 5,),
                          Expanded(
                            child: Text(widget.data.publishedAt,
                            style: AppTextStyle.regularGrey14,),
                          ),
          
                    ],),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10,right: 10,left:10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.data.title,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.boldBlack16,
                          maxLines: 2,),
                          Text(widget.data.summary,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.regularGrey14,
                          maxLines: 3,),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.network(
                          widget.data.image,
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
                            return  Container(
                              color: AppColors.white,

                              child: Center(
                                child: Text('probleme in image',
                                  style: AppTextStyle.boldBlack18),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
          
                  ],
                )
          
          
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(top: 20),
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}

