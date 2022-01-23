import '../controllers/controller_astrologer.dart';
import 'package:get/instance_manager.dart';

class AstroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AstroController());
  }
}
