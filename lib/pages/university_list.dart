import 'package:flutter/material.dart';

class UniversityListPage extends StatefulWidget {
  const UniversityListPage({Key? key}) : super(key: key);

  @override
  State<UniversityListPage> createState() => _UniversityListPageState();
}

List<String> items = ['Item 1', 'Item 2', 'Item 3'];
class _UniversityListPageState extends State<UniversityListPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("University List")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    ));
  }
}
