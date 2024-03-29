import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';
import 'package:UniteToHeal/CustomWidgets/custom_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens.dart';
import 'package:UniteToHeal/Loading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  static String id = 'log_in_page';

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final _email=TextEditingController();
  final _password = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  bool showSpinner = false;

  String? _errorM = null;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'Log In!',
                      style: TextStyle(
                        fontFamily: 'Coiny',
                        fontSize: 28,
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                  showAlert(),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kPurple,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            InputBox(
                                title: 'Enter your email id',
                                icon: Icons.mail,
                                obscureText: false,
                                control: _email,
                              visible: false,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InputBox(
                                title: 'Enter your password',
                                icon: Icons.password,
                                obscureText: true,
                                control: _password,
                              visible: false,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.white
                              ),
                              onPressed: () async {
                                setState(() {
                                  showSpinner = true;
                                });
                                try{
                                  final user = await _auth.signInWithEmailAndPassword(email: _email.text.trim(), password: _password.text.trim());

                                  if(user !=null && _auth.currentUser!.emailVerified) {
                                    Navigator.pushNamedAndRemoveUntil(context, UserPage.id, (route) => false);
                                  }
                                  else {
                                    Fluttertoast.showToast(
                                        msg: "Verify yourself by clicking on link sent to your email",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 5,
                                        backgroundColor: Colors.grey,
                                        textColor: Colors.white,
                                        fontSize: 16.0);

                                    _auth.signOut();
                                  }
                                }
                                catch(e){
                                  setState(() {
                                    _errorM = e.toString();
                                  });
                                  print(e);
                                }
                                setState(() {
                                  showSpinner=false;
                                });
                              },
                              child:Text(
                                'Log In',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Coiny'
                                ),
                              ) ,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Or Log In With',
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
                        Navigator.pushReplacementNamed(context, SignUp.id);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New user? ',
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'Coiny'
                            ),
                          ),
                          Text(
                            'Sign Up',
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
            )
        )
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
