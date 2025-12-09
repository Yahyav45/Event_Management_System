// // import 'dart:convert';
// //
// // import 'package:eventmanagement/payment.dart';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:http/http.dart' as http;
// //
// // import 'HomeScreen/Screens/Home.dart';
// // import 'homenew.dart';
// // import 'makepayment.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const ViewBookingDetails(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }
// //
// // class ViewBookingDetails extends StatefulWidget {
// //   const ViewBookingDetails({super.key, required this.title});
// //
// //   final String title;
// //
// //   @override
// //   State<ViewBookingDetails> createState() => _ViewBookingDetailsState();
// // }
// //
// // class _ViewBookingDetailsState extends State<ViewBookingDetails> {
// //
// //   _ViewBookingDetailsState()
// //
// //   {
// //
// //     view_notification();
// //
// //   }
// //
// //   List<String> eventdate_ = <String>[];
// //   List<String> service_ = <String>[];
// //   List<String> id_ = <String>[];
// //   List<String> bookingstatus_= <String>[];
//
// //
// //
// //
// //   Future<void> view_notification() async {
// //     List<String> eventdate = <String>[];
// //     List<String> service= <String>[];
// //     List<String> id = <String>[];
// //     List<String> bookingstatus = <String>[];
// //
// //     try {
// //       SharedPreferences sh = await SharedPreferences.getInstance();
// //       String urls = sh.getString('url').toString();
// //       String lid = sh.getString('lid').toString();
// //       String url = '$urls/userviewbooking/';
// //
// //       var data = await http.post(Uri.parse(url), body: {
// //
// // 'lid':lid
// //       });
// //       var jsondata = json.decode(data.body);
// //       String statuss = jsondata['status'];
// //
// //       var arr = jsondata["data"];
// //
// //       print(arr.length);
// //
// //       for (int i = 0; i < arr.length; i++) {
// //         eventdate.add(arr[i]['eventdate'].toString());
// //         service.add(arr[i]['service'].toString());
// //         id.add(arr[i]['id'].toString());
// //         bookingstatus.add(arr[i]['bookingstatus'].toString());
// //
// //
// //       }
// //
// //       setState(() {
// //         eventdate_ = eventdate;
// //         service_ = service;
// //         id_ = id;
// //         bookingstatus_ = bookingstatus;
// //       });
// //
// //       print(statuss);
// //     } catch (e) {
// //       print("Error ------------------- " + e.toString());
// //       //there is error during converting file image to base64 encoding.
// //     }
// //   }
// //
// //
// //
// //
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //
// //
// //     return WillPopScope(
// //       onWillPop: () async{
// //
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (context) => MyHomePage()),);
// //
// //         return true; },
// //       child: Scaffold(
// //         appBar: AppBar(
// //           leading: BackButton( onPressed:() {
// //
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => MyHomePage()),);
// //
// //           },),
// //           backgroundColor: Theme.of(context).colorScheme.primary,
// //           title: Text(widget.title),
// //         ),
// //         body: ListView.builder(
// //           physics: BouncingScrollPhysics(),
// //           // padding: EdgeInsets.all(5.0),
// //           // shrinkWrap: true,
// //           itemCount: id_.length,
// //           itemBuilder: (BuildContext context, int index) {
// //             return ListTile(
// //               onLongPress: () {
// //                 print("long press" + index.toString());
// //               },
// //               title: Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Column(
// //                     children: [
// //                       Card(
// //                         child:
// //                         Row(
// //                             children: [
// //                               Column(
// //                                 children: [
// //                                   Padding(
// //                                     padding: EdgeInsets.all(5),
// //                                     child: Text(eventdate_[index]),
// //                                   ),
// //                                   Padding(
// //                                     padding: EdgeInsets.all(5),
// //                                     child: Text(service_[index]),
// //                                   ),    Padding(
// //                                     padding: EdgeInsets.all(5),
// //                                     child: Text(id_[index]),
// //                                   ),  Padding(
// //                                     padding: EdgeInsets.all(5),
// //                                     child: Text(bookingstatus_[index]),
// //                                   ),
// //                                   ElevatedButton(onPressed: () async {
// //
// //                                     SharedPreferences sh = await SharedPreferences.getInstance();
// //                                     sh.setString('vid', id_[index]).toString();
// //
// //                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
// //                                   }, child: Text('Payment')
// //                                   ),
// //                                 ],
// //                               ),
// //
// //                             ]
// //                         ),
// //
// //
// //                         elevation: 8,
// //                         margin: EdgeInsets.all(10),
// //                       ),
// //                     ],
// //                   )),
// //             );
// //           },
// //         ),
// //
// //
// //
// //       ),
// //     );
// //   }
// // }
//
//
// import 'dart:convert';
// import 'package:eventmanagement/payment.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'HomeScreen/Screens/Home.dart';
// import 'homenew.dart';
// import 'makepayment.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ViewBookingDetails(title: 'Booking Details'),
//     );
//   }
// }
//
// class ViewBookingDetails extends StatefulWidget {
//   const ViewBookingDetails({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewBookingDetails> createState() => _ViewBookingDetailsState();
// }
//
// class _ViewBookingDetailsState extends State<ViewBookingDetails> {
//   _ViewBookingDetailsState() {
//     view_notification();
//   }
//
//
//
//   late Razorpay _razorpay;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initializing Razorpay
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//
//   @override
//   void dispose() {
//     // Disposing Razorpay instance to avoid memory leaks
//     _razorpay.clear();
//     super.dispose();
//   }
//
//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {
//     // Handle successful payment
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//     String lid = sh.getString('lid').toString();
//
//     final urls = Uri.parse('$url/userpayment/');
//     try {
//       final response = await http.post(urls, body: {
//         "bid": id_[index],
//         "lid": lid,
//         "amount": amount_[index], // Use the string directly
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status == 'ok') {
//           Fluttertoast.showToast(msg: 'Paid Successfully');
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => MyHomePage()),
//           );
//         } else {
//           Fluttertoast.showToast(msg: 'Not Found');
//         }
//       } else {
//         Fluttertoast.showToast(msg: 'Network Error');
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }
//
//   Future<void> _openCheckout() async {
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String amount = sh.getString('amount').toString(); // Get amount from SharedPreferences
//
//     // Ensure the amount is properly parsed as an integer and multiplied by 100 (paise)
//     int am = int.parse(amount) * 100;
//
//     var options = {
//       'key': 'rzp_test_HKCAwYtLt0rwQe', // Replace with your Razorpay API key
//       'amount': am, // Amount in paise (e.g. 2000 paise = Rs 20)
//       'name': 'Flutter Razorpay Example',
//       'description': 'Payment for the product',
//       'prefill': {'contact': '9747360170', 'email': 'tlikhil@gmail.com'},
//       'external': {
//         'wallets': ['paytm'], // List of external wallets
//       }
//     };
//
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: ${e.toString()}');
//     }
//   }
//
//
//   void _handlePaymentError(PaymentFailureResponse response) {
//     // Handle payment failure
//     print("Error in Payment: ${response.code} - ${response.message}");
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     // Handle external wallet
//     print("External Wallet: ${response.walletName}");
//   }
//
//
//   List<String> eventdate_ = [];
//   List<String> service_ = [];
//   List<String> id_ = [];
//   List<String> bookingstatus_ = [];
//   List<String> amount_ = [];
//
//
//   Future<void> view_notification() async {
//     List<String> eventdate = [];
//     List<String> service = [];
//     List<String> id = [];
//     List<String> bookingstatus = [];
//     List<String> amount = [];
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/userviewbooking/';
//
//       var data = await http.post(Uri.parse(url), body: {'lid': lid});
//       var jsondata = json.decode(data.body);
//       String status = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       for (var item in arr) {
//         eventdate.add(item['eventdate'].toString());
//         service.add(item['service'].toString());
//         id.add(item['id'].toString());
//         bookingstatus.add(item['bookingstatus'].toString());
//         amount.add(item['amount'].toString());
//       }
//
//       setState(() {
//         eventdate_ = eventdate;
//         service_ = service;
//         id_ = id;
//         bookingstatus_ = bookingstatus;
//         amount_ = amount;
//       });
//     } catch (e) {
//       print("Error: ${e.toString()}");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MyHomePage()),
//         );
//         return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: BackButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MyHomePage()),
//               );
//             },
//           ),
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           title: Text(widget.title, style: TextStyle(color: Colors.white)),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: ListView.builder(
//             physics: BouncingScrollPhysics(),
//             itemCount: id_.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 elevation: 5,
//                 margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//                 child: Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Event Date: ${eventdate_[index]}",
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 5),
//                       Text("Service: ${service_[index]}",
//                           style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                       Text("Booking ID: ${id_[index]}",
//                           style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                       Text("Status: ${bookingstatus_[index]}",
//                           style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                       Text("amount: ${amount_[index]}",
//                           style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                       SizedBox(height: 10),
//
//
//                       if(bookingstatus_[index]=='approved')...{
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.deepPurple,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             onPressed: () async {
//                               SharedPreferences sh = await SharedPreferences.getInstance();
//                               // sh.setString('vid', id_[index]).toString();
//                               sh.setString('amount', amount_[index]).toString();
//
//
//                               _openCheckout();
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(builder: (context) => Payment()),
//                               // );
//                             },
//                             child: Text('Make Payment',
//                                 style: TextStyle(color: Colors.white, fontSize: 16)),
//                           ),
//                         ),
//
//                       }
//                       else...{
//
//                       }
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//


import 'dart:convert';
import 'package:eventmanagement/payment.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'HomeScreen/Screens/Home.dart';
import 'homenew.dart';
import 'makepayment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ViewBookingDetails(title: 'Booking Details'),
    );
  }
}

class ViewBookingDetails extends StatefulWidget {
  const ViewBookingDetails({super.key, required this.title});

  final String title;

  @override
  State<ViewBookingDetails> createState() => _ViewBookingDetailsState();
}

class _ViewBookingDetailsState extends State<ViewBookingDetails> {
  _ViewBookingDetailsState(){
    view_notification();
  }
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();

    // Initializing Razorpay
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // Disposing Razorpay instance to avoid memory leaks
    _razorpay.clear();
    super.dispose();
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {

    // Handle successful payment
    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    // Get the booking ID and amount for the successful payment
    String bid =sh.getString("id").toString();
    // String bid = response.paymentId ?? '';
    String amount = sh.getString("amount").toString();
    // String amount = response.signature ?? '';

    final urls = Uri.parse('$url/userpayment/');
    try {
      final res = await http.post(urls, body: {
        "bid": bid,
        "lid": lid,
        "amount": amount,
      });

      if (res.statusCode == 200) {
        String status = jsonDecode(res.body)['status'];
        if (status == 'ok') {
          Fluttertoast.showToast(msg: 'Paid Successfully');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        } else {
          Fluttertoast.showToast(msg: 'Payment failed, try again');
        }
      } else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
    print("Error in Payment: ${response.code} - ${response.message}");
    Fluttertoast.showToast(msg: 'Payment failed: ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet
    print("External Wallet: ${response.walletName}");
  }

  Future<void> _openCheckout(int index) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String amount = amount_[index].toString();
    // String amount = sh.getString('amount').toString();
    String bid = sh.getString('id').toString();

    int am = int.parse(amount) * 100; // Convert to paise (for Razorpay)

    var options = {
      'key': 'rzp_test_HKCAwYtLt0rwQe', // Replace with your Razorpay API key
      'amount': am, // Amount in paise (e.g. 2000 paise = Rs 20)
      'name': 'Flutter Razorpay Example',
      'description': 'Payment for the product',
      'prefill': {'contact': '9747360170', 'email': 'tlikhil@gmail.com'},
      'external': {
        'wallets': ['paytm'], // List of external wallets
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
    }
  }

  List<String> eventdate_ = [];
  List<String> service_ = [];
  List<String> id_ = [];
  List<String> bookingstatus_ = [];
  List<String> amount_ = [];

  Future<void> view_notification() async {
    List<String> eventdate = [];
    List<String> service = [];
    List<String> id = [];
    List<String> bookingstatus = [];
    List<String> amount = [];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/userviewbooking/';

      var data = await http.post(Uri.parse(url), body: {'lid': lid});
      var jsondata = json.decode(data.body);
      String status = jsondata['status'];

      var arr = jsondata["data"];

      for (var item in arr) {
        eventdate.add(item['eventdate'].toString());
        service.add(item['service'].toString());
        id.add(item['id'].toString());
        bookingstatus.add(item['bookingstatus'].toString());
        amount.add(item['amount'].toString());
      }

      setState(() {
        eventdate_ = eventdate;
        service_ = service;
        id_ = id;
        bookingstatus_ = bookingstatus;
        amount_ = amount;
      });
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title, style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: id_.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Event Date: ${eventdate_[index]}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text("Service: ${service_[index]}",
                          style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                      Text("Booking ID: ${id_[index]}",
                          style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                      Text("Status: ${bookingstatus_[index]}",
                          style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                      Text("Amount: ${amount_[index]}",
                          style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                      SizedBox(height: 10),
                      if (bookingstatus_[index] == 'approved') ...{
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              SharedPreferences.getInstance().then((prefs) {
                                prefs.setString('amount', amount_[index]);
                                prefs.setString('id', id_[index]);
                                _openCheckout(index); // Proceed to payment
                              });
                            },
                            child: Text('Make Payment',
                                style: TextStyle(color: Colors.white, fontSize: 16)),
                          ),
                        ),
                      } else ...{}
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
