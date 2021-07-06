import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:UniteToHeal/CustomWidgets/custom_widgets.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: SingleTextLogo(
                size: size,
                title: 'Contact Us',
                image: 'assets/images/contactUs.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: ContactUsBubble(
                icon: Icons.email_sharp,
                info: 'unitetoheal@gmail.com',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: ContactUsBubble(
                icon: Icons.call_rounded,
                info: '+91 9998887771',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: ContactUsBubble(
                icon: FontAwesomeIcons.instagramSquare,
                info: 'www.instagram.com/unite_to_heal',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: ContactUsBubble(
                icon: FontAwesomeIcons.facebook,
                info: 'www.facebook.com/unite_to_heal',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
