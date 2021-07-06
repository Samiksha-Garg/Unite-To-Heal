import 'package:flutter/material.dart';
import 'package:UniteToHeal/CustomWidgets/custom_widgets.dart';
import 'screens.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static String id='home_screen';

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: LogoAvatar(size: size),
            ),
            CustomButton(title: 'Sign Up', function: (){
              Navigator.pushNamed(context, SignUp.id);
            },),
            SizedBox(
              height: 10,
            ),
            CustomButton(title: 'Log In',function: (){
              Navigator.pushNamed(context,LogInPage.id);
            },),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UtilityWidget(
                  width: size.width * 0.20,
                  title: 'Blog',
                  image: 'assets/images/blog_image.jpg',
                  function: () {
                    Navigator.pushNamed(context, BlogPage.id);
                  },
                ),
                UtilityWidget(
                  width: size.width * 0.20,
                  title: 'Donate',
                  image: 'assets/images/donate_image.jpeg',
                  function: () {
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
