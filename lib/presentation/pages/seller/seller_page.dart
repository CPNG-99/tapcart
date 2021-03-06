import 'package:flutter/material.dart';
import 'package:tapcart/presentation/pages/seller/home/seller_home_page.dart';
import 'package:tapcart/presentation/pages/seller/profile/seller_profile_page.dart';
import 'package:tapcart/presentation/pages/seller/scan/seller_scan_page.dart';
import 'package:tapcart/presentation/widget/seller_bottom_navbar.dart';

class SellerPage extends StatefulWidget {
  const SellerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  int _selectedPageIdx = 0;

  static const List<Widget> _pageList = [
    SellerHomePage(),
    SellerScanPage(),
    Center(
      child: Text("COMING SOON"),
    ),
    SellerProfilePage(),
  ];

  void _onTapNavItem(int idx) {
    setState(() {
      _selectedPageIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _pageList.elementAt(_selectedPageIdx),
        ),
        bottomNavigationBar: SellerBottomNavbar(
            selectedPageIdx: _selectedPageIdx, onTapNavItem: _onTapNavItem));
  }
}
