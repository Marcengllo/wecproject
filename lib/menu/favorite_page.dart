import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecproject/controllers/Favorite_controllers.dart';
import 'package:wecproject/reuse_widget/mycolor.dart';

class FavoritePage extends StatelessWidget {
  final FavoritesController controller = Get.put(FavoritesController());

  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundpage,
      appBar: AppBar(
        title: const Text(
          "Favorite",
          style: TextStyle(color: textcolor),
        ),
        backgroundColor: membiru,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (controller.favoriteCards.isEmpty) {
          return const Center(
            child: Text(
              "No favorites yet",
              style: TextStyle(color: textcolor),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.favoriteCards.length,
          itemBuilder: (context, index) {
            final carditem = controller.favoriteCards[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
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
                                "Remove from Favorites",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: textcolor,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.star, color: iconkuning),
                                onPressed: () {
                                  controller.removeFavorite(carditem);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Card(
                color: backgroundcard,
                child: ListTile(
                  leading: Image.network(carditem.imagePath),
                  title: Text(
                    carditem.title,
                    style: const TextStyle(color: textcolor),
                  ),
                  subtitle: Text(
                    carditem.date,
                    style: const TextStyle(color: textcolor),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.star, color: iconkuning),
                    onPressed: () {
                      controller.removeFavorite(carditem);
                    },
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
