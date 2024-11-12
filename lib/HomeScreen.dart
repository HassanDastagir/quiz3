import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bar with List View and Grid View',
              style: TextStyle(color: Colors.white),
        ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'List View'),
              Tab(text: 'Grid View'),
            ],
          ),
          backgroundColor: Colors.black87,
        ),
        body: TabBarView(
          children: [
            ListViewTab(),
            GridViewTab(),

          ],
        ),
      ),
    );
  }
}

class ListViewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.label),
          title: Text('Item ${index + 1}'),
          subtitle: Text('This is subtitle  ${index + 1}'),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(' List Item Tapped is ${index + 1}'),
              ),
            );
          },
        );
      },
    );
  }
}

class GridViewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 7.0,
        mainAxisSpacing: 7.0,
      ),
      padding: EdgeInsets.all(8.0),
      itemCount: 20,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Grid Item Tapped is ${index + 1}'),
              ),
            );
          },
          child: Card(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.widgets, size: 30),
                  SizedBox(height: 8.0),
                  Text('Grid ${index + 1}'
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}