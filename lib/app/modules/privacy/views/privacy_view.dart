import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:cannacal/app/widgets/unordered_list_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/privacy_controller.dart';

class PrivacyView extends GetView<PrivacyController> {
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
            'Privacy Policy',
            style: textStyle.copyWith(
              fontSize: 18,
              color: colorSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
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
                          const TextSpan(text: '''        '''),
                          companyName(),
                          const TextSpan(text: ''' built the '''),
                          companyName(),
                          const TextSpan(
                            text:
                                ''' app as an Ad Supported app and Free app. This SERVICE is provided by ''',
                          ),
                          companyName(),
                          const TextSpan(
                            text:
                                ''' at no cost and is intended for use as is.\n
        This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.\n
        If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.\n
        The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at ''',
                          ),
                          companyName(),
                          const TextSpan(
                            text:
                                ' unless otherwise defined in this Privacy Policy.',
                          ),
                        ]),
                    textAlign: TextAlign.justify),
                Text(
                  '\n\nCCPA Privacy Rights (Do Not Sell My Personal Information)\n',
                  style: textStyle.copyWith(
                    color: colorPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '''        Under the CCPA, among other rights, California consumers have the right to: \n'''),
                        ]),
                    textAlign: TextAlign.justify),
                const UnorderedListItem(
                    text:
                        '''Request that a business that collects a consumer's personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.\n'''),
                const UnorderedListItem(
                    text:
                        '''Request that a business delete any personal data about the consumer that a business has collected.\n'''),
                const UnorderedListItem(
                    text:
                        '''Request that a business that sells a consumer's personal data, not sell the consumer's personal data.'''),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '''\n        If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.'''),
                        ]),
                    textAlign: TextAlign.justify),
                Text(
                  '\n\nGeneral Data Protection Regulation (GDPR)\n',
                  style: textStyle.copyWith(
                    color: colorPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          const TextSpan(
                              text:
                                  '''We are a Data Controller of your information.\n'''),
                          companyName(newLines: true),
                          const TextSpan(
                              text:
                                  ''' legal basis for collecting and using the personal information described in this Privacy Policy depends on the Personal Information we collect and the specific context in which we collect the information:\n\n'''),
                        ]),
                    textAlign: TextAlign.justify),
                const UnorderedListItem(
                    text: '''RHaka needs to perform a contract with you.\n'''),
                const UnorderedListItem(
                    text: '''You have given RHaka permission to do so.\n'''),
                const UnorderedListItem(
                    text:
                        '''Processing your personal information is in RHaka legitimate interests.\n'''),
                const UnorderedListItem(
                    text: '''RHaka needs to comply with the law.\n'''),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          companyName(newLines: true),
                          const TextSpan(
                              text:
                                  ''' will retain your personal information only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use your information to the extent necessary to comply with our legal obligations, resolve disputes, and enforce our policies.
        \n        If you are a resident of the European Economic Area (EEA), you have certain data protection rights. If you wish to be informed what Personal Information we hold about you and if you want it to be removed from our systems, please contact us.
        \n        In certain circumstances, you have the following data protection rights:
        '''),
                        ]),
                    textAlign: TextAlign.justify),
                const UnorderedListItem(
                    text:
                        '''The right to access, update or to delete the information we have on you.'''),
                const UnorderedListItem(
                    text: '''The right of rectification.'''),
                const UnorderedListItem(text: '''The right to object.'''),
                const UnorderedListItem(text: '''The right of restriction.'''),
                const UnorderedListItem(
                    text: '''The right to data portability.'''),
                const UnorderedListItem(
                    text: '''The right to withdraw consent.'''),
                Text(
                  '\n\nInformation Collection and Use\n',
                  style: textStyle.copyWith(
                    color: colorPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '''        For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.
        \n        The app does use third party services that may collect information used to identify you.
        \n        Link to privacy policy of third party service providers used by the app:
        '''),
                        ]),
                    textAlign: TextAlign.justify),
                const UnorderedListItem(
                    text: 'Google Play Services',
                    textType: ListTextType.url,
                    url: 'https://www.google.com/policies/privacy/'),
                const UnorderedListItem(
                    text: 'Admob',
                    textType: ListTextType.url,
                    url:
                        'https://support.google.com/admob/answer/6128543?hl=en'),
                const UnorderedListItem(
                    text: 'Google Analytics for Firebase',
                    textType: ListTextType.url,
                    url: 'https://firebase.google.com/policies/analytics'),
                const UnorderedListItem(
                    text: 'Firebase Crashlytics',
                    textType: ListTextType.url,
                    url: 'https://firebase.google.com/support/privacy/'),
                const UnorderedListItem(
                    text: 'Facebook',
                    textType: ListTextType.url,
                    url:
                        'https://www.facebook.com/about/privacy/update/printable'),
                Text(
                  '\n\nLog Data\n',
                  style: textStyle.copyWith(
                    color: colorPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '''        I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.'''),
                        ]),
                    textAlign: TextAlign.justify),
                Text(
                  '\n\nService Providers\n',
                  style: textStyle.copyWith(
                    color: colorPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '''        I may employ third-party companies and individuals due to the following reasons:\n'''),
                        ]),
                    textAlign: TextAlign.justify),
                const UnorderedListItem(text: '''To facilitate our Service;'''),
                const UnorderedListItem(
                    text: '''To provide the Service on our behalf;'''),
                const UnorderedListItem(
                    text: '''To perform Service-related services; or'''),
                const UnorderedListItem(
                    text:
                        '''To assist us in analyzing how our Service is used.'''),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '''\n        I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.'''),
                        ]),
                    textAlign: TextAlign.justify),
                Text(
                  '\n\nSecurity\n',
                  style: textStyle.copyWith(
                    color: colorPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '''        I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.''')
                        ]),
                    textAlign: TextAlign.justify),
                Text(
                  '\n\nLinks to Other Sites\n',
                  style: textStyle.copyWith(
                    color: colorPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '''        This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.''')
                        ]),
                    textAlign: TextAlign.justify),
                Text(
                  '''\n\nChildren's Privacy\n''',
                  style: textStyle.copyWith(
                    color: colorPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '''        These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.''')
                        ]),
                    textAlign: TextAlign.justify),
                Text(
                  '''\n\nChanges to This Privacy Policy\n''',
                  style: textStyle.copyWith(
                    color: colorPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '''        I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.
        \n        This policy is effective as of 2022-03-10''')
                        ]),
                    textAlign: TextAlign.justify),
                Text(
                  '''\n\nContact Us\n''',
                  style: textStyle.copyWith(
                    fontSize: 18,
                    color: colorPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text.rich(
                    TextSpan(
                        style: textStyle.copyWith(
                          color: colorPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  '''        If you have any questions or suggestions about my Privacy Policy, don't hesitate! please contact us by email at rhakanovcorp@gmail.com. Thank you!
        ''')
                        ]),
                    textAlign: TextAlign.justify),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
