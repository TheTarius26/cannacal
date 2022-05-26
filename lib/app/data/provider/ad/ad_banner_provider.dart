import 'package:cannacal/app/data/enum/ad.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBannerProvider {
  BannerAd getAdBanner(BannerAdListener listener) {
    final BannerAd banner = BannerAd(
        size: AdSize.banner,
        adUnitId: AdUnitId.adUnitBanner,
        listener: listener,
        request: AdRequest());
    banner.load();
    return banner;
  }
}
