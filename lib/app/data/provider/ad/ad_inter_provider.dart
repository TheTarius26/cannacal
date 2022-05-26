import 'package:cannacal/app/data/enum/ad.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdInterstitialProvider {
  void getAdInter(InterstitialAdLoadCallback callback) {
    InterstitialAd.load(
        adUnitId: AdUnitId.adUnitInterstitial,
        request: AdRequest(),
        adLoadCallback: callback);
  }
}
