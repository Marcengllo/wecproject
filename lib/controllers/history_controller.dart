import 'package:get/get.dart';
import 'package:wecproject/model/model_card.dart';

class HistoryController extends GetxController {
  var viewedCards = <modelcard>[].obs;

  void addViewedCard(modelcard card) {
    if (!viewedCards.contains(card)) {
      viewedCards.add(card);
    } else {
      viewedCards.remove(card);
      viewedCards.add(card);
    }
  }
}
