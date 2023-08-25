// import 'package:flutter/material.dart';
// import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
//
// import 'pages/home_page.dart';
// import 'pages/explore_page.dart';
// import 'pages/add_page.dart';
// import 'pages/inbox_page.dart';
// import 'pages/shopping_page.dart';
//
// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     PersistentTabController controller;
//     controller = PersistentTabController(initialIndex: 0);
//
//     List<Widget> _buildScreens() {
//       return [
//         const HomePage(),
//         const ExplorePage(),
//         const AddPage(),
//         const InboxPage(),
//         const ShoppingPage(),
//       ];
//     }
//
//     List<PersistentBottomNavBarItem> _navBarsItems() {
//       return [
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.home),
//           title: ("Home"),
//           activeColorPrimary: Colors.deepPurple,
//           inactiveColorPrimary: Colors.grey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.explore),
//           title: ("Explore"),
//           activeColorPrimary: Colors.deepPurple,
//           inactiveColorPrimary: Colors.grey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.add, color: Colors.white),
//           activeColorPrimary: Colors.deepPurple,
//           inactiveColorPrimary: Colors.grey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.email),
//           title: ("Inbox"),
//           activeColorPrimary: Colors.deepPurple,
//           inactiveColorPrimary: Colors.grey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.shopping_bag),
//           title: ("Shop"),
//           activeColorPrimary: Colors.deepPurple,
//           inactiveColorPrimary: Colors.grey,
//         ),
//       ];
//     }
//
//     return PersistentTabView(
//       context,
//       controller: controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white, // Default is Colors.white.
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset:
//       true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows:
//       true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: const ItemAnimationProperties(
//         // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//         // Screen transition animation on change of selected tab.
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarStyle:
//       NavBarStyle.style15, // Choose the nav bar style with this property.
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// import '../views2/home.dart';
// import '../views2/home1.dart';
// import '../views2/profile_patient.dart';
//
// // void main() => runApp(MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: //MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }
//
// class MyHomePage1 extends StatefulWidget {
//
//
//
//   @override
//   _MyHomePage1State createState() => _MyHomePage1State();
// }
//
// class _MyHomePage1State extends State<MyHomePage1> {
//   // This navigator state will be used to navigate different pages
//   final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
//   int ? _currentTabIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
//         bottomNavigationBar: _bottomNavigationBar(),
//       ),
//     );
//   }
//
//   Widget _bottomNavigationBar() {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       items:  [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: "home",
//         ),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle), label: "Account"),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.settings),label: "Settings",
//         )
//       ],
//       onTap: _onTap,
//       currentIndex: _currentTabIndex!,
//     );
//   }
//
//   _onTap(int tabIndex) {
//     switch (tabIndex) {
//       case 0:
//         _navigatorKey.currentState?.pushReplacementNamed("Home");
//         break;
//       case 1:
//         _navigatorKey.currentState?.pushReplacementNamed('Account');
//         break;
//       case 2:
//         _navigatorKey.currentState?.pushReplacementNamed("Settings");
//         break;
//     }
//     setState(() {
//       _currentTabIndex = tabIndex;
//     });
//   }
//
//   Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case "Account":
//         return MaterialPageRoute(builder: (context) => patient_profile());
//       case "Settings":
//         return MaterialPageRoute(builder: (context) => InkWell(
//           radius: 30,
//           child:  Center(child: Icon(Icons.camera_alt,size: 50,)) ,
//           onTap: (){
//             camera(context);
//           },
//         ));
//       default:
//         return MaterialPageRoute(builder: (context) => HomePage1());
//     }
//   }
// }