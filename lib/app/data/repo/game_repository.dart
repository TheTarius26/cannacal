import 'package:cannacal/app/data/enum/difficulty.dart';
import 'package:cannacal/app/data/model/high_score.dart';
import 'package:cannacal/app/data/model/option.dart';
import 'package:cannacal/app/data/provider/ad/ad_banner_provider.dart';
import 'package:cannacal/app/data/provider/ad/ad_inter_provider.dart';
import 'package:cannacal/app/data/provider/db/high_score_provider.dart';
import 'package:cannacal/app/data/provider/local/option_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GameRepository {
  final OptionProvider _optionProvider;
  final HighScoreProvider _highScoreProvider;
  final AdBannerProvider _adBannerProvider;

  GameRepository({
    required OptionProvider optionProvider,
    required HighScoreProvider highScoreProvider,
    required AdBannerProvider adBannerProvider,
  })  : _optionProvider = optionProvider,
        _highScoreProvider = highScoreProvider,
        _adBannerProvider = adBannerProvider;

  Future<List<Option>> options(int matrix, int point) async =>
      await _optionProvider.getAllOptions(matrix, point);

  Future<void> saveHighScore(String difficulty, int highScore) async =>
      await _highScoreProvider.saveSingleHighScore(difficulty, highScore);

  BannerAd getAdBanner(BannerAdListener listener) {
    return _adBannerProvider.getAdBanner(listener);
  }
}
