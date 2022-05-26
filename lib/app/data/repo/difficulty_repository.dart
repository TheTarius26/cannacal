import 'package:cannacal/app/data/enum/difficulty.dart';
import 'package:cannacal/app/data/model/game_setting.dart';
import 'package:cannacal/app/data/provider/ad/ad_banner_provider.dart';
import 'package:cannacal/app/data/provider/ad/ad_inter_provider.dart';
import 'package:cannacal/app/data/provider/db/high_score_provider.dart';
import 'package:cannacal/app/data/provider/local/difficulty_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DifficultyRepository {
  final DifficultyProvider _difficultyProvider;
  final HighScoreProvider _highScoreProvider;
  final AdBannerProvider _adBannerProvider;
  final AdInterstitialProvider _adInterstitialProvider;

  DifficultyRepository({
    required DifficultyProvider difficultyProvider,
    required HighScoreProvider highScoreProvider,
    required AdBannerProvider adBannerProvider,
    required AdInterstitialProvider adInterstitialProvider,
  })  : _difficultyProvider = difficultyProvider,
        _highScoreProvider = highScoreProvider,
        _adBannerProvider = adBannerProvider,
        _adInterstitialProvider = adInterstitialProvider;

  Future<List<GameSetting>> getListGameSetting() async =>
      await _difficultyProvider.getListGameSetting();

  Future<int> getHighScoreByDifficulty(String difficulty) async =>
      await _highScoreProvider.getHighScoreByDifficulty(difficulty);

  BannerAd getAdBanner(BannerAdListener listener) {
    return _adBannerProvider.getAdBanner(listener);
  }

  void getInterAd(InterstitialAdLoadCallback callback) {
    _adInterstitialProvider.getAdInter(callback);
  }
}
