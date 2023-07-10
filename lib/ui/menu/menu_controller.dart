import 'package:get/get.dart';

class MenuScreenController extends GetxController{

  int? drawerCount = 0;

  changeCount(int index){
    drawerCount = index;
    update();
  }
}