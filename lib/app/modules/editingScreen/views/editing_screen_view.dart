import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/editing_screen_controller.dart';

class EditingScreenView extends GetView<EditingScreenController> {
  const EditingScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditingScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditingScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
