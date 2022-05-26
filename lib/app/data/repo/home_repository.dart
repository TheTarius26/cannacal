import 'package:cannacal/app/data/provider/ad/ad_banner_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeRepository {
  final AdBannerProvider _adBannerProvider;

  HomeRepository({required AdBannerProvider adBannerProvider})
      : _adBannerProvider = adBannerProvider;

  BannerAd getAdBanner(BannerAdListener listener) {
    return _adBannerProvider.getAdBanner(listener);
  }
}
