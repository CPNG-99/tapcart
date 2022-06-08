import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedPageIdx;
  final void Function(int) onTapNavItem;

  const BottomNavbar(
      {Key? key, required this.selectedPageIdx, required this.onTapNavItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "Scan"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Bookmark"),
      ],
      currentIndex: selectedPageIdx,
      onTap: onTapNavItem,
      selectedItemColor: kLightBrown,
      unselectedItemColor: kGrey,
      showUnselectedLabels: true,
    );
  }
}
