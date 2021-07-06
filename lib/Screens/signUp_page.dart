import 'package:flutter/material.dart';
import 'package:UniteToHeal/CustomWidgets/custom_widgets.dart';
import 'package:UniteToHeal/constants.dart';
import 'screens.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static String id='sign_up_page';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  Occupation? _character=Occupation.Doctor;
  Gender? _gender=Gender.Male;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'New User Registration!',
                style: TextStyle(
                  fontFamily: 'Coiny',
                  fontSize: 28,
                  color: kDarkBlue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kPurple,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Enter Your Information',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'BonaNova',
                                fontSize: 25
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InputBox(title: 'Enter your full name', obscureText: false, icon: Icons.person_outline,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InputBox(title: 'Enter your email Id', obscureText: false, icon: Icons.mail,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RadioGenderTile(
                                groupValue: _gender,
                                value: Gender.Male,
                                function: (Gender? value) {
                                  setState(() {
                                    _gender=value;
                                  });
                                },
                                title: 'Male'
                            ),
                            RadioGenderTile(
                                groupValue: _gender,
                                value: Gender.Female,
                                function: (Gender? value) {
                                  setState(() {
                                    _gender=value;
                                  });
                                },
                                title: 'Female'
                            ),
                            RadioGenderTile(
                                groupValue: _gender,
                                value: Gender.Other,
                                function: (Gender? value) {
                                  setState(() {
                                    _gender=value;
                                  });
                                },
                                title: 'Other'
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                          child: InputBox(
                            obscureText: false,
                            title: 'Enter username',
                            icon: Icons.person_add,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InputBox(title: 'Enter Password', obscureText: true, icon: Icons.password,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RadioOccTile(
                                groupValue: _character,
                                value: Occupation.Doctor,
                                function: (Occupation? value) {
                                  setState(() {
                                    _character=value;
                                  });
                                },
                                title: 'Doctor'
                            ),
                            RadioOccTile(
                                groupValue: _character,
                                value: Occupation.Other,
                                function: (Occupation? value) {
                                  setState(() {
                                    _character=value;
                                  });
                                },
                                title: 'Other'
                            ),
                          ],
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white
                          ),
                          onPressed: () {},
                          child:Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Coiny'
                            ),
                          ) ,
                        )
                      ],
                    ),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Text(
                'Or Sign Up With',
                style: TextStyle(
                  fontFamily: 'Coiny',
                  fontSize: 28,
                  color: kDarkBlue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: size.width * 0.15,
                    backgroundImage: ExactAssetImage('assets/images/google-logo.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: size.width * 0.13,
                    backgroundImage: ExactAssetImage('assets/images/Facebook-logo.png'),
                  ),
                ],
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                    primary: kDarkBlue
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LogInPage.id);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a user? ',
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Coiny'
                      ),
                    ),
                    Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'BonaNova'
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}