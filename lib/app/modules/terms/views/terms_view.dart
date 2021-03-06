import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:cannacal/app/routes/app_pages.dart';
import 'package:cannacal/app/widgets/unordered_list_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/terms_controller.dart';

class TermsView extends GetView<TermsController> {
  TextSpan companyName({
    newLines = false,
  }) {
    String text = 'RHaka';
    if (newLines) {
      text = '\n$text';
    }
    return TextSpan(
        text: text,
        style: textStyle.copyWith(
          color: colorPrimary,
          fontWeight: FontWeight.bold,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(
          backgroundColor: colorSecondary,
          title: Text(
            'Terms and Conditions',
            style: textStyle.copyWith(
              fontSize: 18,
              color: colorSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                          TextSpan(
                              style: textStyle.copyWith(
                                color: colorPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      '''        By downloading or using the app, these terms will automatically apply to you - you should make sure therefore that you read them carefully before using the app. You're not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You're not allowed to attempt to extract the source code of the app, and you also shouldn't try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to ''',
                                ),
                                companyName(),
                                const TextSpan(
                                  text: '''.\n        ''',
                                ),
                                companyName(newLines: true),
                                const TextSpan(
                                  text:
                                      ''' is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you're paying for''',
                                ),
                                const TextSpan(
                                  text: '\n\n        The ',
                                ),
                                companyName(),
                                const TextSpan(
                                  text:
                                      ''' app stores and processes personal data that you have provided to us, in order to provide my Service. It's your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone's security features and it could mean that the ''',
                                ),
                                companyName(),
                                const TextSpan(
                                  text:
                                      ''' app won't work properly or at all.''',
                                ),
                                const TextSpan(
                                    text:
                                        '\n\nThe app does use third party services that declare their own Terms and Conditions.\n\nLink to Terms and Conditions of third party service providers used by the app\n'),
                              ]),
                          textAlign: TextAlign.justify),
                      const UnorderedListItem(
                          text: 'Google Play Services',
                          textType: ListTextType.url,
                          url: 'https://policies.google.com/terms'),
                      const UnorderedListItem(
                          text: 'Admob',
                          textType: ListTextType.url,
                          url: 'https://developers.google.com/admob/terms'),
                      const UnorderedListItem(
                          text: 'Google Analytics for Firebase',
                          textType: ListTextType.url,
                          url: 'https://firebase.google.com/terms/analytics'),
                      const UnorderedListItem(
                          text: 'Firebase Crashlytics',
                          textType: ListTextType.url,
                          url: 'https://firebase.google.com/terms/crashlytics'),
                      const UnorderedListItem(
                          text: 'Facebook',
                          textType: ListTextType.url,
                          url:
                              'https://www.facebook.com/legal/terms/plain_text_terms'),
                      Text.rich(
                          TextSpan(
                            style: textStyle.copyWith(
                              color: colorPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              const TextSpan(
                                  text:
                                      '''\n\n        You should be aware that there are certain things that '''),
                              companyName(),
                              const TextSpan(
                                  text:
                                      ''' will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but '''),
                              companyName(),
                              const TextSpan(
                                  text:
                                      ''' cannot take responsibility for the app not working at full functionality if you don't have access to Wi-Fi, and you don't have any of your data allowance left.'''),
                              const TextSpan(
                                  text:
                                      '''\n\n        If you're using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you're accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you're using the app, please be aware that we assume that you have received permission from the bill payer for using the app.'''),
                              const TextSpan(
                                  text:
                                      '''\n\n        Along the same lines, '''),
                              companyName(),
                              const TextSpan(
                                  text:
                                      ''' cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged - if it runs out of battery and you can't turn it on to avail the Service, RHaka cannot accept responsibility.'''),
                              const TextSpan(
                                  text: '''\n\n        With respect to '''),
                              companyName(),
                              const TextSpan(
                                  text:
                                      ''''s responsibility for your use of the app, when you're using the app, it's important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. '''),
                              companyName(),
                              const TextSpan(
                                  text:
                                      ''' accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.'''),
                              const TextSpan(text: '''
            \n\n        At some point, we may wish to update the app. The app is currently available on Android - the requirements for system (and for any additional systems we decide to extend the availability of the app to) may change, and you'll need to download the updates if you want to keep using the app. '''),
                              companyName(),
                              const TextSpan(
                                  text:
                                      ''' does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.\n\n'''),
                            ],
                          ),
                          textAlign: TextAlign.justify),
                      Text(
                        'Change to This Terms & Condition\n',
                        style: textStyle.copyWith(
                          fontSize: 18,
                          color: colorPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '''
              I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.
              These terms and conditions are effective as of 2022-03-10.
              ''',
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'Contact Us\n',
                        style: textStyle.copyWith(
                          fontSize: 18,
                          color: colorPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '''        If you have any questions or suggestions about my Terms and Conditions, don't hesitate!\n     Please contact us by email at rhakanovcorp@gmail.com.
              ''',
                        textAlign: TextAlign.justify,
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GetStorage().read('isTermAccepted') == true
                ? Container()
                : _showAgreement(),
          ],
        ),
      ),
    );
  }

  Expanded _showAgreement() {
    return Expanded(
      flex: 2,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'By clicking "Accept", you agree to our Terms and Conditions',
              style: textStyle.copyWith(color: colorSecondary, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Decline',
                    style: textStyle,
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                ),
                ElevatedButton(
                  onPressed: () {
                    GetStorage().write('isTermAccepted', true);
                    Get.offNamed(Routes.HOME);
                  },
                  child: Text(
                    'Accept',
                    style: textStyle,
                  ),
                  style: ElevatedButton.styleFrom(primary: colorSecondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
