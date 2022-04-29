import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/privacy_controller.dart';

class PrivacyView extends GetView<PrivacyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PrivacyView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PrivacyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
