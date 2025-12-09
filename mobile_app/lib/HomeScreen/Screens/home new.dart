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



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homenew(),
    routes: {
      // 'register': (context) => MyRegister(),
      // 'login': (context) => MyLogin(),
      // 'splash': (context) => SplashScreen(),
    },
  ));
}


class homenew extends StatefulWidget {
  const homenew({super.key});

  @override
  State<homenew> createState() => _homenewState();
}

class _homenewState extends State<homenew> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController(viewportFraction: 0.8);

  String name_ = "";
  String photo_ = "";

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    setState(() {
      name_ = sh.getString("name") ?? "";
      photo_ = sh.getString("photo") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xfff5f7fa),
      appBar: AppBar(
        title: const Text('WEDWHEEL'),
        backgroundColor: const Color.fromARGB(255, 18, 82, 98),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width,
                ),
                SizedBox(
                  height: size.height * 0.2,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return CustomCard(size, context);
                    },
                  ),
                ),
                GradientContainer(size),
              ],
            ),
            DevicesGridDashboard(size: size),
            // ScenesDashboard()
          ],
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: const Color.fromARGB(255, 18, 82, 98)),
            child: Column(
              children: [
                const Text('WEDWHEEL', style: TextStyle(fontSize: 20, color: Colors.white)),
                CircleAvatar(radius: 29, backgroundImage: NetworkImage(photo_)),
                Text(name_, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          drawerItem(Icons.home, 'Home', homenew()),
          drawerItem(Icons.person_pin, 'Change Password', ChangePassword(title: 'Change password')),
          drawerItem(Icons.book_outlined, 'Add Expense Details', ExpenseDetails(title: "Add Expense Details")),
          drawerItem(Icons.logout, 'Logout', MyLoginScreen()),
        ],
      ),
    );
  }

  ListTile drawerItem(IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
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
          width: size.width * .5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage("assets/bg.jpg"),
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
                'WEDDING',
                style: TextStyle(
                    color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
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
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        image: DecorationImage(image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
          gradient: LinearGradient(colors: [
            Colors.blue.withOpacity(0.9),
            Colors.green.withOpacity(0.9)
          ])),
    ),
  );
}
