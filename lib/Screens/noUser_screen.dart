import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';
import 'screens.dart';


class NoUser extends StatelessWidget {
  const NoUser({Key? key}) : super(key: key);

  static String id = 'No_User';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id:(context)=>HomePage(),
        SignUp.id:(context)=>SignUp(),
        LogInPage.id:(context)=>LogInPage(),
        BlogPage.id:(context)=>BlogPage(),
        DonateHomePage.id:(context)=>DonateHomePage(),
        UserPage.id:(context)=>UserPage(),
        NoUser.id : (context)=>NoUser(),
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
            leadingWidth: 200,
            leading: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                    color: kPurple,
                    fontFamily: 'Pacifico',
                    fontSize: 25,
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
