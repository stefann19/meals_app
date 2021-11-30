import 'package:flutter/material.dart';
import 'package:max_guides/widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({Key? key, required this.setFilters, required this.filters}) : super(key: key);
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> filters;
  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState(){
    _glutenFree = widget.filters['gluten'] == true;
    _vegetarian = widget.filters['vegetarian'] == true;
    _vegan = widget.filters['vegan'] == true;
    _lactoseFree = widget.filters['lactose'] == true;
    super.initState();
  }



  Widget buildListTile(String text,String description, bool val, Function onChange){
    return SwitchListTile(
        title: Text(text),
        subtitle: Text(description),
        value: val,
        onChanged: (value)  {
          setState(() {
            onChange(value);
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: () => widget.setFilters({
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                }),
                icon: Icon(Icons.save)
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildListTile('Gluten-free', 'Only include gluten free meals', _glutenFree, (v)=> _glutenFree =v ),
                  buildListTile('Vegetarian', 'Only include vegetarian meals', _vegetarian, (v)=> _vegetarian =v ),
                  buildListTile('Vegan', 'Only include vegan meals', _vegan, (v)=> _vegan =v ),
                  buildListTile('Lactose-free', 'Only include lactose free meals', _lactoseFree, (v)=> _lactoseFree =v )

                ],
              ),
            ),
          ],
        )
    );
  }
}
