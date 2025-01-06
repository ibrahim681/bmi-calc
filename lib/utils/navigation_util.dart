import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> pushScreen(
  Widget widget, {
  required BuildContext context,
  bool removeSession = false,
  bool fullScreenDialog = false,
}) async {
  return Navigator.push(
    context,
    CupertinoPageRoute<dynamic>(
      fullscreenDialog: fullScreenDialog,
      builder: (BuildContext c) => widget,
    ),
  );
}

Future<dynamic> replaceScreen(
  Widget widget, {
  BuildContext? context,
  bool removeSession = false,
}) async {
  return await Navigator.pushAndRemoveUntil<dynamic>(
    context!,
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => widget,
    ),
    (Route<dynamic> route) => false,
  );
}

void clearFocus(BuildContext context) {
  FocusManager.instance.primaryFocus?.unfocus();
}

void pop(BuildContext context) {
  return Navigator.pop(context);
}

class NavigatePageRoute extends CupertinoPageRoute<Widget> {
  NavigatePageRoute(Widget page)
      : super(builder: (BuildContext context) => page) {
    _page = page;
  }

  late Widget _page;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(opacity: animation, child: _page);
  }
}
