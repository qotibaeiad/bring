import 'package:flutter/material.dart';

class listchat extends StatelessWidget {
  final String mainText;
  final String firsticon;
  final String Lasticon;
  const listchat(
      {required this.mainText,
      required this.Lasticon,
      required this.firsticon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _getIconData(this.firsticon),
      title: Text(this.mainText),
      trailing: _getIconData(this.Lasticon),
    );
  }

  Widget _getIconData(String iconName) {
    switch (iconName) {
      case 'home':
        return Icon(Icons.home);
      case 'settings':
        return Icon(Icons.settings);
      case 'edit':
        return Icon(Icons.edit_attributes_outlined);
      case 'person':
        return Icon(Icons.person);
      default:
        return Icon(Icons.error);
    }
  }
}
