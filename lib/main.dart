import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/controller2/bindings/patient_binding.dart';
import 'package:flutter_app/controller2/camera_controller.dart';
import 'package:flutter_app/notes/addnote.dart';
//import 'package:flutter_app/test2.dart';
//import 'package:flutter_app/testt.dart';
import 'package:flutter_app/uploud.dart';
import 'package:flutter_app/views2/HomeView.dart';

import 'package:flutter_app/views2/Rating_doctor.dart';
import 'package:flutter_app/views2/Recommendation_Screen.dart';
import 'package:flutter_app/views2/camera.dart';
import 'package:flutter_app/views2/doctor_profile.dart';
import 'package:flutter_app/views2/home.dart';
import 'package:flutter_app/views2/home1.dart';
import 'package:flutter_app/views2/image_selector_page.dart';
import 'package:flutter_app/views2/login.dart';
import 'package:flutter_app/views2/onboarding.dart';
import 'package:flutter_app/views2/patient_info.dart';
import 'package:flutter_app/views2/patient_info1.dart';
import 'package:flutter_app/views2/profile_patient.dart';
import 'package:flutter_app/views2/sign%20up.dart';
import 'package:flutter_app/views2/splash_screen.dart';
import 'package:flutter_app/whats.dart';
import 'package:flutter_app/widgets2/show_camera.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'User_Page.dart';
import 'allusers.dart';
import 'controller2/Rating_controller.dart';
import 'controller2/bindings/Home_binding.dart';
import 'controller2/bindings/Rating_binding.dart';
import 'controller2/bindings/doctor_binding.dart';

import 'controller2/bindings/splash_binding.dart';
import 'controller2/bindings/test_binding.dart';
import '../controller2/image_picker_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'controller2/splash_controller.dart';

import 'notes/bottom.dart';
//import 'firebase_options.dart';
bool? islogin;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //   (
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
   await GetStorage.init();
  //Get.lazyPut(() => SplashController());
  // Get.put(RatingController());
  Get.put(ImagePickerController(),permanent:true,);
  Get.put(CameraController(),permanent:true,);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'application 1',
      getPages: [
       // GetPage(name:'/ImageSelectorPage',page:()=> ImageSelectorPage()),
        GetPage(name: "/login", page: () => LoginView()),
        GetPage(name: "/SignUp", page: () => SignUp()),
        // GetPage(name: '/Ratingpage',
        //     page: () => Ratingpage(),
        //     binding: RatingBinding()),
        GetPage(
         name: '/onboarding',
          page: () => OnboardingScreen(),
        //   binding: HomeBinding(),
        ),
        GetPage(
          name: '/camera',
          page: () => Show_D(),

        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),

        ),
        GetPage(
          name: "/patient",
          page: () => patient_profile(),
          binding: patientBinding(),
        ),
        GetPage(
          name: '/doctor',
          page: () => doctor_profile(),
          binding: doctorBinding(),
        ),
        GetPage(
          name: '/patient_inffo',
          page: () => Patient_info1(),

        ),
        GetPage(
          name: '/patient_info',
          page: () => Patient_info(),

        ),
        GetPage(
          name: '/splash',
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
        // GetPage(
        //   name: '/testscreen',
        //   page: () => testScreen(),
        //   binding: testBinding(),
        // ),
        GetPage(
          name: '/HomePage1',
          page: () => HomePage1(),

        ),
        // GetPage(
        //   name: '/UserPage',
        //   page: () => UserPage(),
        // ),
        // GetPage(
        //   name: '/All_ussers',
        //   page: () => All_ussers(),
        // ),
        // GetPage(
        //   name: '/test2',
        //   page: () => test2(),
        // ),
        GetPage(
          name: '/Recommendation',
          page: () => Recommendation_screen(),
        ),
        // GetPage(
        //   name: '/Ratingscreen',
        //   page: () => Rating_Doctor(),
        //   binding: RatingBinding(),
        // ),
      ],
      initialRoute: '/splash',
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_app/screens/landing_screen.dart';
//
// import 'package:animated_splash/animated_splash.dart';
// import 'package:flutter/services.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Diabetic Retinopathy Detection',
//       theme: ThemeData.dark(),
//       home: AnimatedSplash(
//         imagePath: 'assets/images/logo.png',
//         duration: 2500,
//         type: AnimatedSplashType.StaticDuration,
//         //home: DetectScreen(title: 'ASL Detection'),
//         home: LandingPage(),
//       ),
//     );
//   }
// }
