import 'package:flutter/material.dart';

class NewsFeedDetailScreen extends StatelessWidget {
  const NewsFeedDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed Screen'),
      ),
      body: Center(
        child: Text('News Feed Screen'),
      ),
    );
  }
}
