import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observable variable for the selected index
  var selectedIndex = 0.obs;

  // Method to update the selected index
  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
