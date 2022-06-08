import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

class TopAppbar extends StatelessWidget {
  const TopAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 70,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: Image.asset(
          "assets/img/tapcart.png",
          fit: BoxFit.contain,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: CircleAvatar(
            backgroundColor: kGrey,
            child: Icon(
              Icons.person,
              color: kRichBlack,
            ),
          ),
        )
      ],
    );
  }
}
