import 'package:flutter/material.dart';
import 'dart:math';

import 'package:navigation_drawer/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[400],
                  Colors.blue[800],
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            "https://uifaces.co/our-content/donated/gPZwCbdS.jpg"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Eren Yager",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ],
                  )),
                  Expanded(
                      child: ListView(
                    children: [
                      Menu(
                        title: "Home",
                        icon: Icons.home,
                      ),
                      Menu(
                        title: "Profile",
                        icon: Icons.person,
                      ),
                      Menu(
                        title: "Setting",
                        icon: Icons.settings,
                      ),
                      Menu(
                        icon: Icons.logout,
                        title: "Log Out",
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: Home(),
                ));
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            }, 
          )
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3D Drawer Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Swipe right to open the menu :happy"),
            ElevatedButton(
                onPressed: () {}, child: Text("Press Me"))
          ],
        ),
      ),
    );
  }
}
