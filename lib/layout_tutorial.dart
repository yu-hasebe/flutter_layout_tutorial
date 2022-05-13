import 'package:flutter/material.dart';

class LayoutTutorial extends StatelessWidget {
  const LayoutTutorial({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    Widget imageSection = Image.asset(article.imagePath,
        width: 600, height: 240, fit: BoxFit.cover);

    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(article.title,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(article.address,
                        style: TextStyle(color: Colors.grey[500]))
                  ]),
            ),
            Icon(Icons.star, color: Colors.red[500]),
            Text(article.numStars.toString())
          ],
        ));

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Padding(
        padding: EdgeInsets.all(32),
        child: Text(
          article.description,
          softWrap: true,
        ));

    return ListView(
      children: [imageSection, titleSection, buttonSection, textSection],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(label,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: color)))
      ],
    );
  }
}

class Article {
  final String imagePath;
  final String title;
  final String address;
  final int numStars;
  final String description;

  Article({
    required this.imagePath,
    required this.title,
    required this.address,
    required this.numStars,
    required this.description,
  });
}
