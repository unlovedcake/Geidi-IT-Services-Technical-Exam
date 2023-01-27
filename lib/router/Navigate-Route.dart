import 'package:flutter/cupertino.dart';

Route pageRouteAnimate(Widget page, {bool isOpaue = true}) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  const curve = Curves.ease;
  return PageRouteBuilder(
    opaque: isOpaue,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
