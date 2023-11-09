import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notes_pre_order_controller.dart';

class NotesPreOrderView extends GetView<NotesPreOrderController> {
  const NotesPreOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotesPreOrderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotesPreOrderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
