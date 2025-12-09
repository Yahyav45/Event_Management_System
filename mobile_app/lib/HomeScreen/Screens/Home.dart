import 'package:eventmanagement/LoginScreen/login.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagement/HomeScreen/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Viewbookingdetails.dart';
import '../../changepassword.dart';
import '../../expensedetails.dart';
import '../../managetodolist.dart';
import '../../searchvendors.dart';
import '../../send appreview.dart';
import '../../sendcomplaint.dart';
import '../../setmarriagedate.dart';
import '../../viewblogs.dart';
import '../../viewexpensedetails.dart';
import '../../viewmarriagedate.dart';
import '../../viewprofile.dart';
import '../../viewreply.dart';
import '../../viewreview.dart';
import '../../viewtodolist.dart';
import 'Rooms.dart';

class MyHomePage extends StatefulWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rooms")),
      body: Center(child: Text("Rooms Page")),
    );
  }
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController(viewportFraction: 0.8);

  _MyHomePageState(){
    getdata();
  }


  String name_="";
  String photo_="";
  getdata()async{

    SharedPreferences sh = await SharedPreferences.getInstance();

    setState(() {
      name_=sh.getString("name").toString();
      photo_=sh.getString("photo").toString();
    });



  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },


      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text('EVENTDEX', style: TextStyle(color: Colors.white),
        ),
          backgroundColor: const Color.fromARGB(255, 18, 82, 98),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),



        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 18, 82, 98),
                ),
                child: Column(children: [
                  const Text(
                    'EVENTDEX',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                   CircleAvatar(radius: 29, backgroundImage: NetworkImage(photo_)),
                   Text(name_, style: TextStyle(color: Colors.white)),
                ]),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
                },
              ),
              ListTile(
                leading: Icon(Icons.person_pin),
                title: const Text(' Change password '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword(title: 'Change password',),));
                },
              ),

              ListTile(
                leading: Icon(Icons.book_outlined),
                title: const Text('Add Expense Details '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseDetails(title: "Add Expense Details",),));
                },
              ), ListTile(
                leading: Icon(Icons.book_outlined),
                title: const Text(' View Expense Details '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewExpenseDetails(title: "View Expense Details",),));
                },
              ),


              ListTile(
                leading: Icon(Icons.local_pharmacy),
                title: const Text(' Manage Todo-list '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ManageToDoList(title: "Manage Todo-list",),));
                },

              ),

              ListTile(
                leading: Icon(Icons.local_pharmacy),
                title: const Text(' View Todo-list '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewToDoList(title: "View Todo-list",),));
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart_sharp),
                title: const Text(' Search Vendors '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchVendors(title: 'Search Vendors',),));
                },
              ),
              ListTile(
                leading: Icon(Icons.feed_outlined),
                title: const Text(' Send App-review '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SendAppReview(title: "Send App Review",),));
                },
              ),

              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Send Complaint'),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => SendComplaint(title: 'Send Complaint',),));
                },
              ),ListTile(
                leading: Icon(Icons.logout),
                title: const Text(' Set Marriage Date '),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => SetMarriageDate(title: 'Set Marriage Date',),));
                },
              ),ListTile(
                leading: Icon(Icons.logout),
                title: const Text(' View Marriage Date '),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => viewmarriagedate(title: 'View Marriage Date',),));
                },
              ),

              ListTile(
                leading: Icon(Icons.logout),
                title: const Text(' View Blogs '),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewBlogs(title: 'View Blogs',),));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text(' View Booking Details '),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewBookingDetails(title: 'View Booking Details',),));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text(' View Profile '),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProfilePage(title: 'View Profile',),));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text(' View Reply '),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReply(title: 'View Reply',),));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text(' View Review '),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReview(title: 'View Review',),));
                },
              ),      ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginScreen(),));
                },
              ),            // Add more ListTiles for other navigation items
            ],
          ),
        ),



        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Container(
                    height: size.height * .4,
                    width: size.width,
                  ),
                ),



                SizedBox(
                  height: size.height * 0.2, // Set height for the carousel
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 8, // Number of items in the carousel
                    itemBuilder: (context, index) {
                      return CustomCard(size, context);
                    },
                  ),
                ),


                GradientContainer(size),
                Positioned(
                  top: size.height * .15,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Let's Celebrate",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.only(top: 10, bottom: 5),
                      //   child: Text(
                      //     "",
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 17),
                      //   ),
                      // ),

                      Row(
                          children: [
                        CustomCard(size, context),
                        // CustomCard(size, context),

                      ]),
                    ],
                  ),
                )
              ],
            ),
            DevicesGridDashboard(size: size),
            ScenesDashboard()
          ]),
        ),
      ),


    );
  }


  Padding CustomCard(Size size, context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Rooms()),
        ),
        child: Container(
          height: size.height * .15,
          width: size.width * .85,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/kiara.jpg",
                ),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: size.height * .12),
              child: const Text(
                'Happy Clients',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

}


  Container GradientContainer(Size size) {
    return Container(
      height: size.height * .3,
      width: size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          image: DecorationImage(
              image: AssetImage('assets/kiara.jpg'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            gradient: LinearGradient(colors: [
              Colors.blue.withOpacity(0.5),
              Colors.green.withOpacity(0.5)
            ])),
      ),
    );
  }




class ScenesDashboard extends StatelessWidget {
  const ScenesDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "HELP",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardWidget(icon: const Icon(Icons.phone, color: Colors.blue), title: 'CONTACT US'
                ),
                CardWidget(icon: const Icon(Icons.note, color: Colors.blue), title: 'ABOUT US')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Icon icon;
  final String title;

  const CardWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 50,
        width: 200,
        child: Center(
          child: ListTile(
            leading: icon,
            title: Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}

class DevicesGridDashboard extends StatelessWidget {
  const DevicesGridDashboard({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                "",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardField(
                    size,
                    Colors.blue,
                    const Icon(Icons.calendar_month, color: Colors.white),
                    'Set Date',
                    '',
                      () {
                    // Navigate to Set Date page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => viewmarriagedate(title: 'Set Date',)));
                  },),
                CardField(
                    size,
                    Colors.amber,
                    const Icon(Icons.people_outline, color: Colors.white),
                    'Vendors',
                    '',
                      () {
                    // Navigate to Set Date page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchVendors(title: 'Vendors',)));
                  },),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardField(
                    size,
                    Colors.orange,
                    const Icon(Icons.check, color: Colors.white),
                    'To-Do List',
                    '',
                      () {
                    // Navigate to Set Date page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewToDoList(title: 'To-Do List',)));
                  },),
                CardField(
                    size,
                    Colors.teal,
                    const Icon(Icons.account_balance_wallet_outlined, color: Colors.white),
                    'Booking Details',
                    '',
                      () {
                    // Navigate to Set Date page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewBookingDetails(title: 'Booking Details',)));
                  },),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardField(

                    size,
                    Colors.purple,
                    const Icon(Icons.currency_rupee_outlined, color: Colors.white),
                    'Expense',
                    '',
                      () {
                    // Navigate to Set Date page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewExpenseDetails(title: 'Expense',)));
                  },),
                CardField(
                    size,
                    Colors.green,
                    const Icon(Icons.picture_in_picture_rounded, color: Colors.white),
                    'Blogs',
                    '',
                      () {
                    // Navigate to Set Date page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewBlogs(title: 'Blogs',)));
                  },),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardField(
                    size,
                    Colors.blue,
                    const Icon(Icons.reply_all, color: Colors.white),
                    'Reply',
                    '',
                      () {
                    // Navigate to Set Date page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReply(title: 'Reply',)));
                  },),
                CardField(
                    size,
                    Colors.amber,
                    const Icon(Icons.star_sharp, color: Colors.white),
                    'Review',
                    '',
                      () {
                    // Navigate to Set Date page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReview(title: 'Review',)));
                  },),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
Widget CardField(
    Size size,
    Color color,
    Icon icon,
    String title,
    String subtitle,
    VoidCallback onTap, // Add this line
    ) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: GestureDetector( // Wrap the Card with GestureDetector
      onTap: onTap, // Assign the onTap function here
      child: Card(
        child: SizedBox(
          height: size.height * .1,
          width: size.width * .39,
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: color,
                child: icon,
              ),
              title: Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              subtitle: Text(
                subtitle,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// Widget CardField(
//     Size size,
//     Color color,
//     Icon icon,
//     String title,
//     String subtitle,
//     ) {
//   return Padding(
//     padding: const EdgeInsets.all(2),
//     child: Card(
//       child: SizedBox(
//         height: size.height * .1,
//         width: size.width * .39,
//         child: Center(
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: color,
//               child: icon,
//             ),
//             title: Text(
//               title,
//               style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14),
//             ),
//             subtitle: Text(
//               subtitle,
//               style: const TextStyle(
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 13),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );


//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: const Color(0xfff5f7fa),
//       drawer:
//       Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 18, 82, 98),
//               ),
//               child:
//               Column(children: [
//
//                 Text(
//                   'CliniSync',
//                   style: TextStyle(fontSize: 20,color: Colors.white),
//
//                 ),
//                 CircleAvatar(radius: 29,backgroundImage: NetworkImage('')),
//                 Text("uname_",style: TextStyle(color: Colors.white)),
//                 Text("email_",style: TextStyle(color: Colors.white)),
//
//
//
//               ])
//
//
//               ,
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: const Text('Home'),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => HomeNewPage(title: 'Home',),));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.person_pin),
//               title: const Text(' Change password '),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword(title: 'Change password',),));
//               },
//             ),
//
//             ListTile(
//               leading: Icon(Icons.book_outlined),
//               title: const Text('Add Expense Details '),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseDetails(title: "Add Expense Details",),));
//               },
//             ), ListTile(
//               leading: Icon(Icons.book_outlined),
//               title: const Text(' View Expense Details '),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ViewExpenseDetails(title: "View Expense Details",),));
//               },
//             ),
//
//
//             ListTile(
//               leading: Icon(Icons.local_pharmacy),
//               title: const Text(' Manage Todo-list '),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ManageToDoList(title: "Manage Todo-list",),));
//               },
//
//             ),
//
//             ListTile(
//               leading: Icon(Icons.local_pharmacy),
//               title: const Text(' View Todo-list '),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ViewToDoList(title: "View Todo-list",),));
//               },
//
//             ),
//
//
//
//
//             ListTile(
//               leading: Icon(Icons.shopping_cart_sharp),
//               title: const Text(' Search Vendors '),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => SearchVendors(title: 'Search Vendors',),));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.feed_outlined),
//               title: const Text(' Send App-review '),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => SendAppReview(title: "Send App Review",),));
//               },
//             ),
//
//
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: const Text('Send Complaint'),
//               onTap: () {
//
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => SendComplaint(title: 'Send Complaint',),));
//               },
//             ),ListTile(
//               leading: Icon(Icons.logout),
//               title: const Text(' Set Marriage Date '),
//               onTap: () {
//
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => SetMarriageDate(title: 'Set Marriage Date',),));
//               },
//             ),
//
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: const Text(' View Blogs '),
//               onTap: () {
//
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ViewBlogs(title: 'View Blogs',),));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: const Text(' View Booking Details '),
//               onTap: () {
//
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ViewBookingDetails(title: 'View Booking Details',),));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: const Text(' View Profile '),
//               onTap: () {
//
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProfilePage(title: 'View Profile',),));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: const Text(' View Reply '),
//               onTap: () {
//
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReply(title: 'View Reply',),));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: const Text(' View Review '),
//               onTap: () {
//
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReview(title: 'View Review',),));
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(children: [
//         Stack(
//           children: [
//             Container(
//               height: size.height * .4,
//               width: size.width,
//             ),
//             GradientContainer(size),
//             Positioned(
//               top: size.height * .15,
//               left: 30,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "My Home",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 26),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 10, bottom: 5),
//                     child: Text(
//                       "Rooms",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 17),
//                     ),
//                   ),
//                   Row(children: [
//                     CustomCard(size, context),
//                     CustomCard(size, context),
//                     CustomCard(size, context),
//                   ]),
//                 ],
//               ),
//             )
//           ],
//         ),
//         DevicesGridDashboard(size: size),
//         ScenesDashboard()
//       ]),
//     );
//   }
//
//   Padding CustomCard(Size size, context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 15),
//       child: GestureDetector(
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Rooms()),
//         ),
//         child: Container(
//           height: size.height * .15,
//           width: size.width * .5,
//           decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(8),
//               image: const DecorationImage(
//                 image: AssetImage(
//                   "assets/bg.jpg",
//                 ),
//                 fit: BoxFit.cover,
//               )),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.black.withOpacity(0.3),
//             ),
//             child: Padding(
//               padding: EdgeInsets.only(left: 15, top: size.height * .12),
//               child: const Text(
//                 'Room',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Container GradientContainer(Size size) {
//     return Container(
//       height: size.height * .3,
//       width: size.width,
//       decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30)),
//           image: DecorationImage(
//               image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30)),
//             gradient: LinearGradient(colors: [
//               Colors.blue.withOpacity(0.9), // Replace with your secondaryColor
//               Colors.green.withOpacity(0.9) // Replace with your primaryColor
//             ])),
//       ),
//     );
//   }
// }
//
// class ScenesDashboard extends StatelessWidget {
//   const ScenesDashboard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 15),
//             child: Text(
//               "Scenes",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17),
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 CardWidget(icon: Icon(Icons.home_work_rounded, color: Colors.blue), title: 'Coming Home'),
//                 CardWidget(icon: Icon(Icons.home, color: Colors.blue), title: 'At Home')
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class CardWidget extends StatelessWidget {
//   final Icon icon;
//   final String title;
//
//   CardWidget({
//     Key? key,
//     required this.icon,
//     required this.title,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: SizedBox(
//         height: 50,
//         width: 200,
//         child: Center(
//           child: ListTile(
//             leading: icon,
//             title: Text(
//               title,
//               style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DevicesGridDashboard extends StatelessWidget {
//   const DevicesGridDashboard({Key? key, required this.size}) : super(key: key);
//
//   final Size size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(bottom: 15),
//             child: Text(
//               "Devices",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CardField(
//                   size,
//                   Colors.blue,
//                   Icon(Icons.camera_outlined, color: Colors.white),
//                   'Cameras',
//                   '8 Devices'),
//               CardField(
//                   size,
//                   Colors.amber,
//                   Icon(Icons.lightbulb_outline, color: Colors.white),
//                   'Lights',
//                   '8 Devices'),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CardField(
//                   size,
//                   Colors.orange,
//                   Icon(Icons.music_note_outlined, color: Colors.white),
//                   'Speakers',
//                   '2 Devices'),
//               CardField(
//                   size,
//                   Colors.teal,
//                   Icon(Icons.sports_cricket_sharp, color: Colors.white),
//                   'Cricket bat',
//                   '8 Devices'),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CardField(
//                   size,
//                   Colors.purple,
//                   Icon(Icons.wifi_outlined, color: Colors.white),
//                   'Sensors',
//                   '5 Devices'),
//               CardField(
//                   size,
//                   Colors.green,
//                   Icon(Icons.air_outlined, color: Colors.white),
//                   'Air Condition',
//                   '4 Devices'),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//
// Widget CardField(
//     Size size,
//     Color color,
//     Icon icon,
//     String title,
//     String subtitle,
//     ) {
//   return Padding(
//     padding: const EdgeInsets.all(2),
//     child: Card(
//       child: SizedBox(
//         height: size.height * .1,
//         width: size.width * .39,
//         child: Center(
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: color,
//               child: icon,
//             ),
//             title: Text(
//               title,
//               style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14),
//             ),
//             subtitle: Text(
//               subtitle,
//               style: const TextStyle(
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 13),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Add any other classes such as Rooms here.

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Builder(builder: (context) {
//       return Scaffold(
//           backgroundColor: Color(0xfff5f7fa),
//           body: Column(children: [
//             Stack(
//               children: [
//                 Container(
//                   height: size.height * .4,
//                   width: size.width,
//                 ),
//                 GradientContainer(size),
//                 Positioned(
//                     top: size.height * .15,
//                     left: 30,
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "My Home",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 26),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(top: 10, bottom: 5),
//                             child: Text(
//                               "Rooms",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 17),
//                             ),
//                           ),
//                           Row(children: [
//                             CustomCard(size,context),
//                             CustomCard(size,context),
//                             CustomCard(size,context),
//                           ]),
//                         ]))
//               ],
//             ),
//             DevicesGridDashboard(size: size),
//             ScenesDashboard()
//           ]));
//     });
//   }
//
//   Padding CustomCard(Size size, context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 15),
//       child: GestureDetector(
//         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Rooms(),)),
//         child: Container(
//           height: size.height * .15,
//           width: size.width * .5,
//           decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(8),
//               image: const DecorationImage(
//                 image: AssetImage(
//                   "assets/bg.jpg",
//                 ),
//                 fit: BoxFit.cover,
//               )),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.black.withOpacity(0.3),
//             ),
//             child: Padding(
//               padding: EdgeInsets.only(left: 15, top: size.height * .12),
//               child: const Text(
//                 'Room',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Container GradientContainer(Size size) {
//     return Container(
//       height: size.height * .3,
//       width: size.width,
//       decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30)),
//           image: DecorationImage(
//               image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30)),
//             gradient: LinearGradient(colors: [
//               secondaryColor.withOpacity(0.9),
//               primaryColor.withOpacity(0.9)
//             ])),
//       ),
//     );
//   }
// }
//
// class ScenesDashboard extends StatelessWidget {
//   const ScenesDashboard({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(padding: EdgeInsets.symmetric(horizontal: 30),
//     child:  Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//        Padding(
//     padding: EdgeInsets.symmetric(vertical: 15),
//     child: Text(
//       "Scenes",
//       style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontSize: 17),
//     ),
//           ),
//           SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       children: [
//         CardWidget(icon: Icon(Icons.home_work_rounded,color: secondaryColor,), title: 'Coming Home'),
//         CardWidget(icon: Icon(Icons.home,color: secondaryColor,), title: 'At Home')
//       ],
//     ),
//           )
//     ],),);
//   }
// }
//
// class CardWidget extends StatelessWidget {
//   Icon icon;
//   String title;
//    CardWidget({
//     Key? key,
//     required this.icon,
//     required this.title
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: SizedBox(
//         height: 50,
//         width: 200,
//         child: Center(child: ListTile(leading: icon,title: Text(
//           title,
//           style: const TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 14),
//         ),),),
//       ),
//     );
//   }
// }
//
// class DevicesGridDashboard extends StatelessWidget {
//   const DevicesGridDashboard({
//     Key? key,
//     required this.size,
//   }) : super(key: key);
//
//   final Size size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(bottom: 15),
//             child: Text(
//               "Devices",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 17),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CardField(
//                   size,
//                   Colors.blue,
//                   Icon(
//                     Icons.camera_outlined,
//                     color: Colors.white,
//                   ),
//                   'Cameras',
//                   '8 Devices'),
//               CardField(
//                   size,
//                   Colors.amber,
//                   Icon(Icons.lightbulb_outline, color: Colors.white),
//                   'Lights',
//                   '8 Devices'),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CardField(
//                   size,
//                   Colors.orange,
//                   Icon(Icons.music_note_outlined, color: Colors.white),
//                   'Speakers',
//                   '2 Devices'),
//               CardField(
//                   size,
//                   Colors.teal,
//                   Icon(Icons.sports_cricket_sharp, color: Colors.white),
//                   'Cricket bat',
//                   '8 Devices'),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CardField(
//                   size,
//                   Colors.purple,
//                   Icon(Icons.wifi_outlined, color: Colors.white),
//                   'Sensors',
//                   '5 Devices'),
//               CardField(
//                   size,
//                   Colors.green,
//                   Icon(Icons.air_outlined, color: Colors.white),
//                   'Air Condition',
//                   '4 Devices'),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//
// CardField(
//   Size size,
//   Color color,
//   Icon icon,
//   String title,
//   String subtitle,
// ) {
//   return Padding(
//     padding: const EdgeInsets.all(2),
//     child: Card(
//         child: SizedBox(
//             height: size.height * .1,
//             width: size.width * .39,
//             child: Center(
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: color,
//                   child: icon,
//                 ),
//                 title: Text(
//                   title,
//                   style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14),
//                 ),
//                 subtitle: Text(
//                   subtitle,
//                   style: const TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 13),
//                 ),
//               ),
//             ))),
//   );
// }
