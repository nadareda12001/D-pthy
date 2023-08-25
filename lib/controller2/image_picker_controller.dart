import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class ImagePickerController extends GetxController {
  final box1 = GetStorage();
  var imagePath = "";
  var isImagePathSet = false.obs;
  @override
  Future<void> dependencies() async {
    await GetStorage.init();
    Get.put(ImagePickerController(),permanent: true);
  }
  void onInit() {
    super.onInit();
     box1.read('image5');
    box1.read('set5');

  }

  void setImagePath(String path) {
    imagePath= path;
    isImagePathSet.value = true;
    box1.listen(() {'image5';});
    box1.writeIfNull('image5', path);
    box1.write('set5', true);
    update();
  }
}
