import 'package:yalla_chat/core/resources/colors_manager.dart';
import 'package:yalla_chat/features/bottom_bar/controllers/bottom_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarView extends GetView<BottomBarController> {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(<BottomBarController>() {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: ColorManager.grey,
          selectedItemColor: ColorManager.green,
          currentIndex: controller.selectedIndex.value,
          items: controller.items,
          onTap: controller.onItemTapped,
        ),
        body: controller.pages.elementAt(controller.selectedIndex.value),
      );
    });
  }
}
