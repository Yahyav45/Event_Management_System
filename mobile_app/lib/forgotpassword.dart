import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../homenew.dart';
import '../signup.dart';
import 'LoginScreen/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController unameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.black),
                            controller:unameController ,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // TextField(
                          //   controller: passController,
                          //   style: TextStyle(),
                          //   obscureText: true,
                          //   decoration: InputDecoration(
                          //       fillColor: Colors.grey.shade100,
                          //       filled: true,
                          //       hintText: "Password",
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       )),
                          // ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SUBMIT',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {


                                      _send_data();
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // TextButton(
                              //   onPressed: () {
                              //     Navigator.push(context, MaterialPageRoute(
                              //       builder: (context) => MyMySignupPage(title: "Sign Up"),));
                              //     // Navigator.pushNamed(context, 'register');
                              //   },
                              //   child: Text(
                              //     'Sign Up',
                              //     textAlign: TextAlign.left,
                              //     style: TextStyle(
                              //         decoration: TextDecoration.underline,
                              //         color: Color(0xff4c505b),
                              //         fontSize: 18),
                              //   ),
                              //   style: ButtonStyle(),
                              // ),
                              // TextButton(
                              //     onPressed: () {},
                              //     child: Text(
                              //       'Forgot Password',
                              //       style: TextStyle(
                              //         decoration: TextDecoration.underline,
                              //         color: Color(0xff4c505b),
                              //         fontSize: 18,
                              //       ),
                              //     )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }







  void _send_data() async{


    String uname=unameController.text;
    String password=passController.text;



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/forgotpassword/');
    try {
      final response = await http.post(urls, body: {
        'uname':uname,


      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {


          Fluttertoast.showToast(msg: 'Please Check Your Email');



          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyLoginScreen(),));
        }else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }

}
