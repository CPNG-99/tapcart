import 'package:flutter/material.dart';
import 'package:tapcart/presentation/pages/seller_home_page.dart';
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
    Center(
      child: Text("Active Cart"),
    ),
    Center(
      child: Text("HISTORY"),
    ),
    Center(
      child: Text("BOOKMARK"),
    ),
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
