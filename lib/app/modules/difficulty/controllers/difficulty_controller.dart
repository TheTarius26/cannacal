import 'package:cannacal/app/data/repo/difficulty_repository.dart';
import 'package:cannacal/app/modules/difficulty/widgets/difficulty_item.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DifficultyController extends GetxController {
  final DifficultyRepository _difficultyRepository;

  DifficultyController({required DifficultyRepository difficultyRepository})
      : _difficultyRepository = difficultyRepository;

  final listDifficulty = <DifficultyItem>[].obs;

  // AdMob
  BannerAd? bannerAd;
  final isAdBannerLoaded = false.obs;
  final isAdInterstitialLoaded = false.obs;
  InterstitialAd? interstitialAd;

  @override
  void onReady() {
    super.onReady();
    getDifficultyList();
    loadAdBanner();
    loadAdInter();
  }

  @override
  void onClose() {
    try {
      bannerAd!.dispose();
      interstitialAd!.dispose();
    } catch (e) {
      printError(info: 'Failed to dispose');
    }
  }

  void getDifficultyList() async {
    final list = await _difficultyRepository.getListGameSetting();
    for (var item in list) {
      final highScore = await _difficultyRepository.getHighScoreByDifficulty(
        item.difficulty,
      );
      listDifficulty.add(DifficultyItem(
        highScore: highScore.toString(),
        gameSetting: item,
      ));
    }
  }

  void loadAdBanner() {
    if (!isAdBannerLoaded.value) {
      bannerAd = _difficultyRepository.getAdBanner(
        BannerAdListener(
            onAdFailedToLoad: (ad, error) => ad.dispose(),
            onAdLoaded: (ad) {
              isAdBannerLoaded.value = true;
            }),
      );
    }
  }

  void loadAdInter() {
    _difficultyRepository.getInterAd(InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          isAdInterstitialLoaded.value = true;
        },
        onAdFailedToLoad: (LoadAdError error) {}));
  }
}
