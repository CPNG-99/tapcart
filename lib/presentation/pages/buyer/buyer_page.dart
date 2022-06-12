import 'package:flutter/material.dart';
import 'package:tapcart/presentation/pages/buyer/buyer_active_cart_page.dart';
import 'package:tapcart/presentation/widget/buyer_bottom_navbar.dart';

class BuyerPage extends StatefulWidget {
  const BuyerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BuyerPageState();
}

class _BuyerPageState extends State<BuyerPage> {
  int _selectedPageIdx = 1;

  static const List<Widget> _pageList = [
    BuyerActiveCartPage(),
    Center(
      child: Text("Lasted Scan"),
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
        bottomNavigationBar: BuyerBottomNavbar(
            selectedPageIdx: _selectedPageIdx, onTapNavItem: _onTapNavItem));
  }
}
