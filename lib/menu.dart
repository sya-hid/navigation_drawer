import 'package:flutter/material.dart';
class Menu extends StatelessWidget {
  final String title;
  final IconData icon;
  const Menu({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
