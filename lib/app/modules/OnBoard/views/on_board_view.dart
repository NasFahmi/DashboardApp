import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/on_board_controller.dart';

class OnBoardView extends GetView<OnBoardController> {
  const OnBoardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnBoardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OnBoardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
