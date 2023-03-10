import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:news_app/views/web_view_news.dart';

import '../models/article_model.dart';
import '../widgets/custom_appBar.dart';

class NewsDetailsPage extends StatelessWidget {
  final ArticleModel data;
  const NewsDetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar('News Details', context),
        body: Container(
            margin: const EdgeInsets.only(left: 10),
            height: 500,
            width: double.maxFinite,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
                  child: Image.network(data.urlToImage!, height: 200, width: double.maxFinite, fit: BoxFit.fitWidth)),
              const Text('Title :-', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 10),
              Expanded(child: Text(data.title ?? '')),
              const Text('Description :-', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 10),
              Expanded(child: Text(data.description ?? '')),
              const SizedBox(height: 10),
              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: AppColors.burgundy),
                      onPressed: () => Get.to(() => WebViewNews(newsUrl: data.url ?? '')),
                      child: const Text('View in Browser')))
            ])));
  }
}
