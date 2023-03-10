import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/news_details_page.dart';
import 'package:news_app/widgets/news_card.dart';

const String dataBoxName = "data";

class BookmarkedPage extends StatefulWidget {
  const BookmarkedPage({super.key});

  @override
  State<BookmarkedPage> createState() => _BookmarkedPageState();
}

class _BookmarkedPageState extends State<BookmarkedPage> {
  late Box<ArticleModel> dataBox;

  @override
  void initState() {
    super.initState();
    dataBox = Hive.box<ArticleModel>(dataBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return dataBox.values.isEmpty
        ? const Center(child: Text('No bookmarked!!'))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: dataBox.values.length,
            itemBuilder: (context, index) {
              var data = dataBox.getAt(index)!;
              return InkWell(
                onTap: () => Get.to(() => NewsDetailsPage(data: data)),
                child: NewsCard(data: data),
              );
            });
  }
}
