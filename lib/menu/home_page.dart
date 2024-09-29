// views/home_menu.dart
import 'package:flutter/material.dart';
import 'package:wecproject/datalist/data_fia.dart';
import 'package:wecproject/datalist/data_news.dart';
import 'package:wecproject/datalist/data_patrners.dart';
import 'package:wecproject/datalist/data_trending.dart';
import 'package:wecproject/reuse_widget/card_info.dart';
import 'package:wecproject/reuse_widget/mycolor.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundpage,
      appBar: AppBar(
        title: Image.asset(
          'image/ewc.png',
          width: 90,
          height: 90,
        ),
        backgroundColor: membiru,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 37,
            color: textcolor,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 280,
                child: Image.asset(
                  'image/lehmans.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 75,
                left: 5,
                child: Text(
                  '24 HOURS OF LE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 110,
                left: 5,
                child: Text(
                  'MANS 2024',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 220,
                left: 5,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.open_in_new),
                  label: Text(
                    'OPEN',
                    style: TextStyle(color: textcolor),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: membiru,
                    iconColor: textcolor,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
           Padding(
          padding: const EdgeInsets.all(1),
          child: Cardinfo(
            itemcard: itemtrending,
            title: 'TRENDING',
          ),
        ),
           Padding(
          padding: const EdgeInsets.all(1),
          child: Cardinfo(
            itemcard: itemNews,
            title: 'NEWS',
          ),
        ),
           Padding(
          padding: const EdgeInsets.all(1),
          child: Cardinfo(
            itemcard: itemfia,
            title: 'FIA WEC 2024',
          ),
        ),
           Padding(
          padding: const EdgeInsets.all(1),
          child: Cardinfo(
            itemcard: itempatners,
            title: 'PARTNERS',
          ),
        ),
        ],
      ),
    );
  }
}
