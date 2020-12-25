import 'package:flutter/material.dart';
import 'package:my_router_flutter/common/widget_markdown.dart';
import 'explain.dart';

class RadiosCheckboxs extends StatefulWidget {
  const RadiosCheckboxs({Key key}) : super(key: key);

  @override
  _RadiosCheckboxs createState() => _RadiosCheckboxs();
}

class _ListItems {
  _ListItems(this.value, this.checked);

  final String value;
  bool checked;
}

class _RadiosCheckboxs extends State<RadiosCheckboxs> {
  bool _reverseSort = false;
  final _items = <String>[
    'Checkbox1',
    'Checkbox2',
    'Checkbox3',
    'Checkbox4',
    'Checkbox5',
    'Checkbox6',
    'Checkbox7',
    'Checkbox8',
    'Checkbox9',
    'Checkbox10',
  ].map((item) => _ListItems(item, false)).toList();

  @override
  Widget build(BuildContext context) {
    void _onSort() {
      setState(() {
        _reverseSort = !_reverseSort;
        _items.sort((_ListItems a, _ListItems b) =>
        _reverseSort
            ? b.value.compareTo(a.value)
            : a.value.compareTo(b.value));
      });
    }
    final _appbar = AppBar(
      title: Text('Reorderable list'),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.sort_by_alpha),
          tooltip: 'Sort',
          onPressed: _onSort,
        ),
      ],
    );
    final _listTiles = _items
        .map(
          (item) =>
          CheckboxListTile(
            key: Key(item.value),
            value: item.checked ?? false,
            onChanged: (bool newValue) {
              setState(() => item.checked = newValue);
            },
            title: Text('This item represents ${item.value}.'),
            isThreeLine: true,
            subtitle: Text('Item ${item.value}, checked=${item.checked}'),
            secondary: Icon(Icons.drag_handle),
          ),
    )
        .toList();
    return Scaffold(
      appBar: _appbar,
      body: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                WidgetMarkdown(data: """
```
new CheckboxListTile(
    secondary: const Icon(Icons.shutter_speed),
    title: const Text('硬件加速'),
    value: this.check,
    onChanged: (bool value) {
        setState(() {
            this.check = !this.check;
        });
    },
),
```
                """),
                Scrollbar(
                    child: SingleChildScrollView(
                        child:Column(
                            children:_listTiles
                        )
                   )
                )
              ],
            ),
          )
      )
      ,
    );
  }
}
