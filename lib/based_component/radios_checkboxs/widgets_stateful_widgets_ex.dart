import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:my_router_flutter/flutter_widget/lists/tile_example.dart';
import 'explain.dart';

class StatefulWidgetsExample extends StatefulWidget {
  const StatefulWidgetsExample({Key key}) : super(key: key);

  @override
  _StatefulWidgetsExample createState() => _StatefulWidgetsExample();
}

class _StatefulWidgetsExample extends State<StatefulWidgetsExample> {
  bool _switchVal = true;
  double _slider1Val = 0.5;
  double _slider2Val = 50.0;
  int _radioVal = 0;




  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: double.infinity, minHeight: 30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // verticalDirection:VerticalDirection.down,
                    children: <Widget>[
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Switch',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'root.description',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(100, 0, 0, 0)),
                          ),
                        ],
                      ),
                      Switch(
                        onChanged: (bool value) {
                          setState(() => this._switchVal = value);
                        },
                        value: this._switchVal,
                      )
                    ],
                  )),
              Divider(),
              ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: double.infinity, minHeight: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Disabled Switch',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'root.description',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromARGB(100, 0, 0, 0)),
                        ),
                      ],
                    ),
                    Switch(
                      onChanged: null,
                      value: false,
                    ),
                  ],
                ),
              ),
              Divider(),
              ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: double.infinity, minHeight: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Disabled Switch',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'root.description',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromARGB(100, 0, 0, 0)),
                        ),
                      ],
                    ),
                    Checkbox(
                      onChanged: (bool value) {
                        setState(() => this._switchVal = value);
                      },
                      value: this._switchVal,
                    ),
                  ],
                ),
              ),
              Divider(),
              ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: double.infinity, minHeight: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Disabled Checkbox',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Disabled',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromARGB(100, 0, 0, 0)),
                        ),
                      ],
                    ),
                    Checkbox(
                      tristate: true,
                      onChanged: null,
                      value: null,
                    ),
                  ],
                ),
              ),
              Divider(),
              Text('Slider'),
              Slider(
                onChanged: (double value) {
                  setState(() => this._slider1Val = value);
                },
                value: this._slider1Val,
              ),
              Divider(),
              Text('Slider with Divisions and Label'),
              Slider(
                  value: _slider2Val,
                  min: 0.0,
                  max: 100.0,
                  divisions: 10,
                  label: '${_slider2Val.round()}',
                  onChanged: (double value) {
                    setState(() => _slider2Val = value);
                  }),
              Divider(),
              Divider(),
              Text('LinearProgressIndicator'),
              // **When value=null, progress indicators become stateless.**
              LinearProgressIndicator(),
              Divider(),
              Text('CircularProgressIndicator'),
              Center(child: CircularProgressIndicator()),
              Divider(),
              Text('Radio'),
              Row(
                children: [0, 1, 2, 3]
                    .map((int index) => Radio<int>(
                  value: index,
                  groupValue: this._radioVal,
                  onChanged: (int value) {
                    setState(() => this._radioVal = value);
                  },
                ))
                    .toList(),
              ),
              Divider(),
            ],
          ),
        ),
      );
}

/**
    class _StatefulWidgetsExample extends State<StatefulWidgetsExample>{

    @override
    Widget build(BuildContext context) => Scaffold(
    body: Markdown(
    data: _markdownData,
    )
    );

    }
 */
