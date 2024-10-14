import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecproject/controllers/Favorite_controllers.dart';
import 'package:wecproject/controllers/history_controller.dart';
import 'package:wecproject/model/model_card.dart';
import 'package:wecproject/reuse_widget/mycolor.dart';

class Cardinfo extends StatelessWidget {
  final List<modelcard> itemcard;
  final String title;
  final FavoritesController favoritesController = Get.put(FavoritesController());
  final HistoryController historyController = Get.put(HistoryController());

  Cardinfo({
    super.key,
    required this.itemcard,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            title,
            style: TextStyle(
              color: textcolor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 240,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: itemcard.map((carditem) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      historyController.addViewedCard(carditem);

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    carditem.imagePath,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 150,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  carditem.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: textcolor,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  carditem.date,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Add to Favorites",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: textcolor,
                                      ),
                                    ),
                                    Obx(() {
                                      bool isFav = favoritesController.isFavorite(carditem);
                                      return IconButton(
                                        icon: Icon(
                                          isFav ? Icons.star : Icons.star_border,
                                          color: isFav ? iconkuning : textcolor,
                                        ),
                                        onPressed: () {
                                          if (isFav) {
                                            favoritesController.removeFavorite(carditem);
                                          } else {
                                            favoritesController.addFavorite(carditem);
                                          }
                                        },
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Obx(() {
                      bool isFav = favoritesController.isFavorite(carditem);
                      return Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.network(
                                carditem.imagePath,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 130,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    carditem.title,
                                    style: TextStyle(
                                      color: textcolor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    carditem.date,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
