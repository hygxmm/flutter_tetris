import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<int>> lists = [
    [0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 2, 0, 2, 2, 2, 2, 2, 0, 2],
  ];

  void moveToLeft() {}
  void moveToRight() {}
  void moveToDown() {}
  void changeShape() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              BackgroundCanvas(lists),
              Expanded(
                child: ActionPanel(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
 * 操作面板
 */

class ActionPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width * 0.4;
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: PreviewView(),
            ),
          ),
          Center(
            child: Container(
              width: _width,
              height: _width,
              child: Column(
                children: <Widget>[
                  Container(
                    width: _width / 3,
                    height: _width / 3,
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Icon(Icons.arrow_drop_up),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: _width / 3,
                          height: _width / 3,
                          child: RaisedButton(
                            color: Colors.blue,
                            child: Icon(Icons.arrow_left),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: _width / 3,
                          height: _width / 3,
                          child: RaisedButton(
                            color: Colors.blue,
                            child: Icon(Icons.arrow_right),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: _width / 3,
                    height: _width / 3,
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Icon(Icons.arrow_drop_down),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
 *信息面板
 */
class ScorePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('分数: '),
              Text('data'),
            ],
          ),
          Row(
            children: <Widget>[
              Text('时间: '),
              Text('data'),
            ],
          ),
        ],
      ),
    );
  }
}

/*
 * 视图组件
 */
class BackgroundCanvas extends StatelessWidget {
  final List<List<int>> lists;
  BackgroundCanvas(this.lists);
  final defColor = Colors.black;
  final curColor = Colors.red;
  final firColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width * 0.7;
    final _height = MediaQuery.of(context).size.width * 0.7 * 2;
    final _itemWidth = (_width - 11) / 10;
    final _itemHeight = (_height - 11) / 20;
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        color: Colors.grey.shade500,
        border: Border.all(
          color: Colors.grey.shade500,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: lists.map<Widget>((item) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: item.map<Widget>((ele) {
              return Container(
                width: _itemWidth,
                height: _itemHeight,
                color: ele == 0 ? defColor : ele == 1 ? curColor : firColor,
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}

/*
 * 下一个预览组件
 */

class PreviewView extends StatelessWidget {
  final List<List<int>> lists = [
    [0, 0, 1, 0],
    [0, 1, 1, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 0],
  ];
  // final List previews;
  // PreviewView(this.previews);
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width * 0.7;
    final _height = MediaQuery.of(context).size.width * 0.7 * 2;
    final _itemWidth = (_width - 11) / 10;
    final _itemHeight = (_height - 11) / 20;
    final defColor = Colors.black;
    final curColor = Colors.red;
    return Container(
      width: _itemWidth * 4 + 5,
      height: _itemHeight * 4 + 5,
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: lists.map<Widget>((item) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: item.map<Widget>((ele) {
              return Container(
                width: _itemWidth,
                height: _itemHeight,
                color: ele == 0 ? defColor : curColor,
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
