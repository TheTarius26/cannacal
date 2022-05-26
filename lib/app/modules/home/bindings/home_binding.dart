import 'package:cannacal/app/data/provider/ad/ad_banner_provider.dart';
import 'package:cannacal/app/data/repo/home_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(homeRepository: Get.find<HomeRepository>()),
    );
    Get.lazyPut(
        () => HomeRepository(adBannerProvider: Get.find<AdBannerProvider>()));
    Get.lazyPut(() => AdBannerProvider());
  }
}
