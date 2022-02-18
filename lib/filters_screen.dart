import 'package:flutter/material.dart';
import 'package:flutter_application_1/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  FilterScreen(this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  Widget SwitchListtile(
      String title, String subtitle, bool value, Function(bool) _updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: _updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("chill"),
          actions: <Widget>[
            IconButton(
                onPressed: widget.saveFilters, icon: const Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Adjust your meal selection.",
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            Expanded(
                child: ListView(children: [
              SwitchListtile(
                  "Gluten-free", "Only include gluten-free meals", _glutenFree,
                  (newvalue) {
                setState(() {
                  _glutenFree = newvalue;
                });
              }),
              SwitchListtile("Lactose-free", "Only include Lactose-free meals",
                  _lactoseFree, (newvalue) {
                setState(() {
                  _lactoseFree = newvalue;
                });
              }),
              SwitchListtile(
                  "Vegan-free", "Only include Vegan-free meals", _vegan,
                  (newvalue) {
                setState(() {
                  _vegan = newvalue;
                });
              }),
              SwitchListtile(
                  "Vegetarian-free",
                  "Only include Vegetarian-free meals",
                  _vegetarian, (newvalue) {
                setState(() {
                  _vegetarian = newvalue;
                });
              }),
            ]))
          ],
        ));
  }
}
