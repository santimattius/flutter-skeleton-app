import 'package:flutter/material.dart';

import 'header_box.dart';
import 'header_icon.dart';

class AuthenticationBackground extends StatelessWidget {
  final Widget child;

  const AuthenticationBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          HeaderBox(),
          HeaderIcon(),
          child,
        ],
      ),
    );
  }
}
