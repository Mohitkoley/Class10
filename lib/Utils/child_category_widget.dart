import 'package:flutter/Material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(),
          title: Text(""),
        ),
      ),
    );
  }
}
