import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../shared/remote/dio_helper.dart';

class PostProvider with ChangeNotifier {
  final List<PostModel> _posts = [];
  String? _nextUrl;
  bool _isFetching = false;
  String _searchQuery = '';
  bool _isError = false;
  Timer? _debounce;


  List<PostModel> get posts => _posts;
  bool get isFetching => _isFetching;
  bool get isError => _isError;
  String get searchQuery => _searchQuery;

  void setSearchQuery(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchQuery = query;
      _posts.clear();
      fetchPosts(searchQuery: query);
    });
  }
  clearSearchQuery() {
    _searchQuery = '';
    _posts.clear();
    fetchPosts();
  }
  Future<void> loadMorePosts() async {
    if (_nextUrl != null && !_isFetching) {
      await fetchPosts(url: _nextUrl,);
    }
  }



  Future<void> fetchPosts({String? url, String? searchQuery}) async {

    if (_isFetching) return;
    _isFetching = true;
    _isError = false;
    notifyListeners();

    try {
      final response = await DioHelper.getData(url: url ?? '/v4/articles/',
          query:searchQuery != null ? {'search': searchQuery} : null );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        if(data.isEmpty){
          _isError = true;
          notifyListeners();
          return Future.error('Failed to load data');
        }
        final List<PostModel> newPosts = data.map((item) => PostModel.fromJson(item)).toList();
        _nextUrl = response.data['next'];
        _posts.addAll(newPosts);
      } else {

        return Future.error('Failed to load data');
      }
    } catch (error) {
      if (error is DioException &&
          (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.connectionError)) {
        _isError = true;
        notifyListeners();
        return await Future.error('connection timeout');

      } else if (error is DioException) {
        _isError = true;
        notifyListeners();
        return await Future.error('connection other');
      } else {
        _isError = true;
        notifyListeners();
        return await Future.error('connection other');
      }
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }


}
