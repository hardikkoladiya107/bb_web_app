import 'package:get/get.dart';

class HomeController extends GetxController{


  int? drawerCount = 1;

  changeCount(int index){
    drawerCount = index;
    update();
  }
}