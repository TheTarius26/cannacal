import 'package:cannacal/app/data/repo/home_repository.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final HomeRepository _homeRepository;
  HomeController({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  final count = 0.obs;

  BannerAd? bannerAd;

  final isAdBannerLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadAdBanner();
  }

  @override
  void onClose() {
    bannerAd!.dispose();
  }

  void increment() => count.value++;

  void loadAdBanner() {
    if (!isAdBannerLoaded.value) {
      bannerAd = _homeRepository.getAdBanner(
        BannerAdListener(
            onAdFailedToLoad: (ad, error) => ad.dispose(),
            onAdLoaded: (ad) {
              isAdBannerLoaded.value = true;
            }),
      );
    }
  }
}
