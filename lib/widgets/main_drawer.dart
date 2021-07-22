import 'package:delimeal/screens/filter_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget buildListTile(
      String title, IconData icon, BuildContext context, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 16),
      title: Text(
        title,
        style: Theme.of(context).textTheme.button,
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 16),
          buildListTile(
            'Meals',
            Icons.restaurant,
            context,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filters',
            Icons.filter,
            context,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
