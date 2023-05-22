import 'package:flutter/material.dart';

void main() {
  runApp(NestedListViewExample());
}

class NestedListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nested ListView Example'),
        ),
        body: ListView.builder(
          itemCount: 5, // Number of outer ListView items
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text('Outer Item $index'),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3, // Number of inner ListView items
                    itemBuilder: (BuildContext context, int innerIndex) {
                      return ListTile(
                        title: Text('Inner Item $innerIndex'),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}