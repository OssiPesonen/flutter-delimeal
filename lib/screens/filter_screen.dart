import 'package:delimeal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> filters;
  final Function saveFilters;

  FilterScreen(this.filters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  Function saveFilters;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };

                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten free',
                  'Only gluten free meals',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose free',
                  'Only lactose free meals',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only lactose free meals',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only vegan meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                )
              ],
            ))
          ],
        ));
  }
}
