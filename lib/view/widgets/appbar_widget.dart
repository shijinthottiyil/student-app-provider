import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitle;
  final List<Widget>? actionsWidgets;

  const AppBarWidget({
    super.key,
    this.appBarTitle,
    this.actionsWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      title: Center(
        child: Text(
          appBarTitle.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      actions: actionsWidgets,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
