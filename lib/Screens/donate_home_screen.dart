import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';
import 'package:UniteToHeal/CustomWidgets/custom_widgets.dart';

class DonateHomePage extends StatefulWidget {
  const DonateHomePage({Key? key}) : super(key: key);

  static String id='donate_home_page';

  @override
  _DonateHomePageState createState() => _DonateHomePageState();
}

class _DonateHomePageState extends State<DonateHomePage> {

  Payment? _payment = Payment.One_Time;
  bool? receiptChecked = false;
  bool? anonymousChecked = false;
  bool? emailChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 180,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child: Text(
              'Donate!',
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
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Donation Information',
                style: TextStyle(
                  fontFamily: 'Coiny',
                  fontSize: 28,
                  color: kDarkBlue,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kPurple,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      InputBox(
                          title: 'Enter First Name',
                          icon: Icons.person,
                          obscureText: false
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InputBox(
                          title: 'Enter Last Name',
                          icon: Icons.person,
                          obscureText: false
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InputBox(
                          title: 'Enter your email Id',
                          icon: Icons.mail,
                          obscureText: false
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RadioPayment(
                              groupValue: _payment,
                              value: Payment.One_Time,
                              function: (value) {
                                setState(() {
                                  _payment = value;
                                });
                              },
                              title: 'One-Time'
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RadioPayment(
                              groupValue: _payment,
                              value: Payment.Monthly,
                              function: (value) {
                                setState(() {
                                  _payment = value;
                                });
                              },
                              title: 'Monthly'
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      PaymentTile(title: 'Email me a receipt', isChecked: receiptChecked,
                          function: (value) {
                        setState(() {
                          receiptChecked = value;
                        });
                      }
                      ),
                      PaymentTile(title: 'Give Anonymously', isChecked: anonymousChecked,
                          function: (value) {
                            setState(() {
                              anonymousChecked = value;
                            });
                          }
                      ),
                      PaymentTile(title: 'Add me to email list', isChecked: emailChecked,
                          function: (value) {
                            setState(() {
                              emailChecked = value;
                            });
                          }
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.white
                        ),
                        onPressed: () {},
                        child:Text(
                          'Proceed',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Coiny'
                          ),
                        ) ,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
