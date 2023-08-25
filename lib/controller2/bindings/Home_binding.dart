import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../home_controller.dart';

class Home_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Home_Controller());
  }
}

