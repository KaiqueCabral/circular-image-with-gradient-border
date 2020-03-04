import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Image with Gradient Border',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Circular Image with Gradient Border'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _red = 100;
  double _green = 100;
  double _blue = 100;
  double _width;

  @override
  void initState() {
    super.initState();
    _width = 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 270,
            height: 270,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 250 + _width,
                    height: 250 + _width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromRGBO(_red.toInt(), 0, 0, 1),
                          Color.fromRGBO(0, _green.toInt(), 0, 1),
                          Color.fromRGBO(0, 0, _blue.toInt(), 1),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  // top: 10,
                  // left: 10,
                  alignment: Alignment.center,
                  child: Container(
                    width: 230,
                    height: 230,
                    padding: EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://cdn-media-1.freecodecamp.org/images/1*6xT0ZOACZCdy_61tTJ3r1Q.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Cores",
          ),
          Slider(
            min: 100,
            max: 255,
            value: _red,
            activeColor: Color.fromRGBO(_red.toInt(), 0, 0, 1),
            onChanged: (value) {
              setState(() {
                _red = value;
              });
            },
          ),
          Slider(
            min: 100,
            max: 255,
            value: _green,
            activeColor: Color.fromRGBO(0, _green.toInt(), 0, 1),
            onChanged: (value) {
              setState(() {
                _green = value;
              });
            },
          ),
          Slider(
            min: 100,
            max: 255,
            value: _blue,
            activeColor: Color.fromRGBO(0, 0, _blue.toInt(), 1),
            onChanged: (value) {
              setState(() {
                _blue = value;
              });
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Tamanho da Borda",
          ),
          Slider(
            min: 0,
            max: 20,
            value: _width,
            activeColor: Colors.amber,
            onChanged: (value) {
              setState(() {
                _width = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
