import 'package:yalla_chat/features/bottom_bar/presentations/rooms_feature/view/rooms_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  final List<Widget> _pages = [
    const RoomsView(),
    const Scaffold(body: Center(child: Text('call'))),
    const Scaffold(body: Center(child: Text('camera'))),
    const Scaffold(body: Center(child: Text('setting'))),
  ];
  List<Widget> get pages => _pages;

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.phone),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_applications_outlined),
      label: '',
    ),
  ];
  List<BottomNavigationBarItem> get items => _items;

  final RxInt _selectedIndex = 0.obs;
  RxInt get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex.value = index;
    update();
  }
}
