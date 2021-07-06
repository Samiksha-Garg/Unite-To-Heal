import 'package:flutter/material.dart';
import 'package:UniteToHeal/Screens/screens.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id:(context)=>HomePage(),
        SignUp.id:(context)=>SignUp(),
        LogInPage.id:(context)=>LogInPage()
      },
      title: 'Unite To Heal',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          unselectedWidgetColor: Colors.white
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 180,
            leading: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                    color: kPurple,
                    fontFamily: 'Pacifico',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: (){},
                  icon: Icon(Icons.settings, color: kPurple, size: 30,)
              ),
            ],
            bottom: TabBar(
              indicatorColor: kPurple,
              labelStyle: kTabBarStyle,
              labelColor: kPurple,
              unselectedLabelColor: kPurple.withAlpha(90),
              tabs: [
                Text('HOME'),
                Text('OUR MISSION'),
                Text('CONTACT US'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              HomePage(),
              MissionPage(),
              ContactUsPage(),
            ],
          ),
        ),
      ),
    );
  }
}