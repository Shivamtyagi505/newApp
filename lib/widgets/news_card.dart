import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:news_app/constants/size_constants.dart';
import 'package:news_app/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:news_app/contollers/news_controller.dart';
import 'package:news_app/models/article_model.dart';

import '../views/web_view_news.dart';

const String dataBoxName = "data";

class NewsCard extends StatelessWidget {
  final ArticleModel data;

  const NewsCard({Key? key, required this.data});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsController>();
    Box<ArticleModel> dataBox;
    dataBox = Hive.box<ArticleModel>(dataBoxName);
    return GetBuilder<NewsController>(builder: (_) {
      return Card(
        elevation: Sizes.dimen_4,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10))),
        margin: const EdgeInsets.fromLTRB(Sizes.dimen_16, 0, Sizes.dimen_16, Sizes.dimen_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(Sizes.dimen_10), topRight: Radius.circular(Sizes.dimen_10)),
                child: Image.network(
                  data.urlToImage ?? '',
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  // if the image is null
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: const SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Icon(Icons.broken_image_outlined),
                      ),
                    );
                  },
                )),
            vertical15,
            Padding(
              padding: const EdgeInsets.all(Sizes.dimen_6),
              child: Text(
                data.title ?? '',
                maxLines: 2,
                style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.dimen_6),
              child: Text(
                data.description ?? '',
                maxLines: 2,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_red_eye),
                  onPressed: (() => Get.to(() => WebViewNews(newsUrl: data.url ?? ''))),
                ),
                IconButton(
                  icon: Icon(Icons.favorite, color: data.isBookmarked ? AppColors.burgundy : Colors.grey),
                  onPressed: () {
                    controller.updateValue(data, true);
                    dataBox.add(data);
                  },
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
