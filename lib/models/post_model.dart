import 'package:intl/intl.dart';

class PostModel {
  final int id;
  final String title;
  final String url;
  final String image;
  final String newsSite;
  final String summary;
  final String publishedAt;

  PostModel({required this.id, required this.title, required this.url,
    required this.image, required this.newsSite, required this.summary,
    required this.publishedAt});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      image: json['image_url'] ?? '',
      newsSite: json['news_site'] ?? '',
      summary: json['summary'] ?? '',
      publishedAt:json['updated_at'] != null ? _formatDate(json['updated_at']) : _formatDate(json['published_at']),
    );
  }
  static String _formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd MMMM yyyy').format(dateTime);
  }
}