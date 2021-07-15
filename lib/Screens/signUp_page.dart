import 'package:UniteToHeal/Loading.dart';
import 'package:UniteToHeal/Screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:UniteToHeal/CustomWidgets/custom_widgets.dart';
import 'package:UniteToHeal/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool showSpinner = false;

  final _email=TextEditingController();
  final _password = TextEditingController();
  final _username = TextEditingController();
  final _name = TextEditingController();

  bool _nameValidate = false;
  bool _usernameValidate = false;

  String? _errorM = null;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _username.dispose();
    _name.dispose();
    super.dispose();
  }

  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return showSpinner? Loading() : Scaffold(
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
            showAlert(),
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
                          child: InputBox(title: 'Enter your full name', obscureText: false, icon: Icons.person_outline,control: _name,visible: _nameValidate,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InputBox(title: 'Enter your email Id', obscureText: false, icon: Icons.mail, control: _email,visible: false,),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
                          child: InputBox(
                            obscureText: false,
                            title: 'Enter username',
                            icon: Icons.person_add,
                            control: _username,
                            visible: _usernameValidate,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InputBox(title: 'Enter Password', obscureText: true, icon: Icons.password,control: _password,visible: false,),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
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
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white
                          ),
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                              _usernameValidate = _username.text.isEmpty ? true : false;
                              _nameValidate = _name.text.isEmpty ? true : false;
                            });

                            if (_usernameValidate==false && _nameValidate==false) {
                              try {
                                final newUser = await _auth
                                    .createUserWithEmailAndPassword(
                                    email: _email.text,
                                    password: _password.text);

                                if (newUser != null) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, UserPage.id, (route) => false);
                                }

                                setState(() {
                                  showSpinner = false;
                                });
                              }
                              catch (e) {
                                print(e);
                                setState(() {
                                  showSpinner = false;
                                  _errorM = e.toString();
                                });
                              }
                            }

                            setState(() {
                              showSpinner = false;
                            });
                          },
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

  Widget showAlert() {
    if(_errorM!=null) {
      return Container(
        color: Colors.red,
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(right: 8), child: Icon(Icons.error_outline,color: Colors.white,),),
            Expanded(child:Text(_errorM.toString(),style: TextStyle(color: Colors.white),)),
            Padding(padding: EdgeInsets.only(left: 8),
              child: IconButton(
                icon: Icon(Icons.close,color: Colors.white,),
                onPressed: (){
                  setState(() {
                    _errorM = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }
}