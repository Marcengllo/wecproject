import 'package:flutter/material.dart';
import 'package:wecproject/datalist/klasmen_data.dart';
import 'package:wecproject/reuse_widget/mycolor.dart';

class klasemenMenu extends StatefulWidget {
  const klasemenMenu({super.key});

  @override
  State<klasemenMenu> createState() => _klasemenMenuState();
}

class _klasemenMenuState extends State<klasemenMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundpage,
      appBar: AppBar(
        title: const Text("Klasemen",
        style: TextStyle(color: textcolor),),
        backgroundColor: membiru,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: klasemenData.length,
        itemBuilder: (context, index) {
          final item = klasemenData[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: backgroundcard,
            child: ListTile(
              leading: Image.asset(
                item.logo,
                width: 50,
                height: 50,
              ),
              title: Text(
                "${item.position}. ${item.team}",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: textcolor),
              ),
              subtitle: Text("${item.points} Pts",
              style: const TextStyle(color: textcolor,fontSize: 13),),
            ),
          );
        },
      ),
    );
  }
}
