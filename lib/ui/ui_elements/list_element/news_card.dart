import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osam/osam.dart';
import 'package:share/share.dart';

import 'news_card_presenter.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final presenter = PresenterProvider.of<NewsCardPresenter>(context);
    final article = presenter.article;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (ctx) => Container())..createAnimationController());
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white10)
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 4.0),
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Expanded(
                      child: Text(article.source.name,
                          style: TextStyle(color: CupertinoColors.white))),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(CupertinoIcons.reply, color: Colors.white),
                        onPressed: () async {
                          Share.share(article.url);
                        },
                      ),
                      StreamBuilder(
                        initialData: presenter.initialData,
                        stream: presenter.stream,
                        builder: (ctx, AsyncSnapshot<bool> snapshot) {
                          return IconButton(
                            icon: Icon(
                                snapshot.data ? CupertinoIcons.book_solid : CupertinoIcons.book,
                                color: Colors.white),
                            onPressed: () async {
                              snapshot.data
                                  ? presenter.removeFromFavorites()
                                  : presenter.addToFavorites();
                            },
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child:
                  Text(article.title, style: TextStyle(color: CupertinoColors.white, fontSize: 20)),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerRight,
              child: Text(article.publishedAt, style: TextStyle(color: CupertinoColors.white)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  } //  Animation animation;

}
