import 'package:flutter/material.dart';

class BottomNavigtaionMyBar extends StatefulWidget {
  const BottomNavigtaionMyBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigtaionMyBar> createState() => _BottomNavigtaionMyBarState();
}

class _BottomNavigtaionMyBarState extends State<BottomNavigtaionMyBar> {
  final TextsNavigationBarItemsUtilies itemsTexts =
      TextsNavigationBarItemsUtilies();

  late final List<bool> trysomethinglist;
  @override
  void initState() {
    trysomethinglist = [false, false, false, false];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          setState(() {
            for (var i = 0; i < 4; i++) {
              value == i
                  ? trysomethinglist[i] = true
                  : trysomethinglist[i] = false;
            }
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: trysomethinglist[0] == true ? ColorsUtility().green: ColorsUtility().grey,
              ),
              label: itemsTexts.home),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.comment,
                color: trysomethinglist[1] == true ? ColorsUtility().green:ColorsUtility().grey,
              ),
              label: itemsTexts.comment),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_none,
                color: trysomethinglist[2] == true ? ColorsUtility().green: ColorsUtility().grey,
              ),
              label: itemsTexts.notifications),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: trysomethinglist[3] == true ? ColorsUtility().green: ColorsUtility().grey,
              ),
              label: itemsTexts.account),
        ]);
  }
}

class ColorsUtility {
  final Color green = Colors.green;
  final Color grey = Colors.grey;
  
}

enum NavigationItems { home, comment, notifications, account }

class TextsNavigationBarItemsUtilies {
  final String home = 'Home';
  final String comment = 'Comment';
  final String notifications = 'Notifica';
  final String account = 'Account';
}
