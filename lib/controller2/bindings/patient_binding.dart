import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../patient_controller.dart';


class patientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => patientController());
  }}




