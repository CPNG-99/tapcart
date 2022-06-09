import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

class SellerBottomNavbar extends StatelessWidget {
  final int selectedPageIdx;
  final void Function(int) onTapNavItem;

  const SellerBottomNavbar(
      {Key? key, required this.selectedPageIdx, required this.onTapNavItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: "Scan Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile"),
      ],
      currentIndex: selectedPageIdx,
      onTap: onTapNavItem,
      selectedItemColor: kLightBrown,
      unselectedItemColor: kGrey,
      showUnselectedLabels: true,
    );
  }
}
