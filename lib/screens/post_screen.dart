import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import '../utils/widgets/cards/artical_card.dart';
import '../utils/widgets/errors/errors_components.dart';
import '../utils/widgets/text_field/search_field_list.dart';

class PostScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('News App'),
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent &&
                  !postProvider.isFetching) {
                postProvider.loadMorePosts();
              }
              return true;
            },
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: false,
                  title: SearchField(
                    clear: () {
                      if(searchController.text.isNotEmpty){
                        searchController.clear();
                        postProvider.clearSearchQuery();
                      }
                      else{
                        return;
                      }

                    },
                    contoller: searchController,
                    type: TextInputType.text,
                    label: 'Search',
                    change: (value) {

                      postProvider.setSearchQuery(value);
                    },
                  ),
                  toolbarHeight: 70,
                ),
                FutureBuilder<void>(
                  future: postProvider.posts.isEmpty && !postProvider.isError ? postProvider.fetchPosts() : null,
                  builder: (context, snapshot) {
                      if ((postProvider.posts.isEmpty && !postProvider.isError) || snapshot.connectionState == ConnectionState.waiting) {
                        return SliverFillRemaining(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      else if (snapshot.error == 'connection timeout') {
                        return SliverFillRemaining(
                          child: Center(
                            child: ConnectionProbleme(
                              pressed: () {
                                postProvider.fetchPosts();
                              },
                            ),
                          ),
                        );
                      }
                      else if ((postProvider.posts.isEmpty && postProvider.isError ) || snapshot.error == 'Failed to load data') {
                      return SliverFillRemaining(
                        child: Center(
                          child: NodataFound(
                            pressed: () {
                              postProvider.fetchPosts();
                            },
                          ),
                        ),
                      );
                    }
                      else if(snapshot.error =='connection other') {
                      return SliverFillRemaining(
                        child: Center(
                          child: UndifinedProbleme(
                            pressed: () {
                              postProvider.fetchPosts();
                            },
                          ),
                        ),
                      );
                    }
                      else{
                        final posts = postProvider.posts;
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              if (index == posts.length) {
                                return postProvider.isFetching
                                    ? Center(child: CircularProgressIndicator())
                                    : SizedBox.shrink();
                              }
                              final post = posts[index];
                              return ArticalCard(
                                data: post,
                              );
                            },
                            childCount: posts.length + 1,
                          ),
                        );
                      }


                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
