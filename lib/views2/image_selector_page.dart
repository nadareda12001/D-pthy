// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/testt.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import '../controller2/image_picker_controller.dart';
//
// class ImageSelectorPage extends StatelessWidget {
//
//   File? imageFile;
//   ImagePicker imagePicker = ImagePicker();
//   final ImagePickerController imagePickerController = Get.find<ImagePickerController >();
//   ImageSelectorPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Image Picker Page",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                GetBuilder<ImagePickerController>(builder: (imagePickerController)=>CircleAvatar(
//                       radius: 80,
//                       backgroundImage: imagePickerController.box1.read('set5') == true
//                           ? FileImage(File(imagePickerController.box1.read('image5'))) as ImageProvider
//                           : AssetImage("images/logo.png"),
//                )),
//                 Positioned(
//                   width: 30,
//                   right: 30,
//                    bottom: 0,
//                   child: InkWell(
//                     child: const Icon(
//                       Icons.camera_alt,
//                       color: Colors.black87,
//                     ),
//                     onTap: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (context) => bottomSheet(context),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             TextButton(child: Text("click"),onPressed: (){Get.to(testScreen());},)
//           ],
//         ),
//       ),
//     );
//   }
// //
//   Widget bottomSheet(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       width: double.infinity,
//       height: 100,
//       margin: EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 20,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "Select or Capture Photo",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 child: Column(
//                   children: const [
//                     Icon(
//                       Icons.camera,
//                       color: Colors.purple,
//                     ),
//                     Text(
//                       "Camera",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.purple),
//                     ),
//                   ],
//                 ),
//                 onTap: () {
//                   takePhoto(ImageSource.camera, context);
//                 },
//               ),
//               SizedBox(
//                 width: size.width * 0.4,
//               ),
//               InkWell(
//                 child: Column(
//                   children: const [
//                     Icon(
//                       Icons.image,
//                       color: Colors.deepPurple,
//                     ),
//                     Text(
//                       "Gallery",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.deepPurple),
//                     ),
//                   ],
//                 ),
//                 onTap: () {
//                   takePhoto(ImageSource.gallery, context);
//                 },
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   Future<void> takePhoto1(ImageSource source, BuildContext context) async {
//     final pickedImage =
//         await imagePicker.pickImage(source: source, imageQuality: 100);
//
//     imageFile = File(pickedImage!.path);
//
//     imagePickerController.setImagePath(imageFile!.path);
//     Navigator.pop(context);
//   }
// }
////////////////////////////////////////////////////////////////////
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class ImageSelectorPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _ImageSelectorPageState();
// }
//
// class _ImageSelectorPageState extends State<ImageSelectorPage> {
//
//   String filePath = '';
//
//   getImage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool check = prefs.containsKey('image');
//     if (check) {
//       setState(() {
//         filePath = prefs.getString('image')!;
//       });
//       return;
//     }
//     ImagePicker imagePicker = new ImagePicker();
//     PickedFile? image = await imagePicker.getImage(source: ImageSource.gallery);
//     String imagePath = image!.path;
//     await prefs.setString('image', imagePath);
//     setState(() {
//       filePath = prefs.getString('image')!;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getImage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Container(
//           child: filePath == '' ? TextButton(
//             onPressed: getImage,
//             child: Text('get image'),
//           ) : Image.file(File(filePath)),
//         )
//     );
//   }
// }
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImageSelectorPage extends StatefulWidget {
//   const ImageSelectorPage({Key? key}) : super(key: key);
//
//   @override
//   State<ImageSelectorPage> createState() => _ImageSelectorPageState();
// }
//
// class _ImageSelectorPageState extends State<ImageSelectorPage> {
//   String selectedImagePath = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.yellow.shade800,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             selectedImagePath == ''
//                 ? Image.asset('assets/images/image_placeholder.png', height: 200, width: 200, fit: BoxFit.fill,)
//                 : Image.file(File(selectedImagePath), height: 200, width: 200, fit: BoxFit.fill,),
//             Text(
//               'Select Image',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.green),
//                     padding:
//                     MaterialStateProperty.all(const EdgeInsets.all(20)),
//                     textStyle: MaterialStateProperty.all(
//                         const TextStyle(fontSize: 14, color: Colors.white))),
//                 onPressed: () async {
//                   selectImage();
//                   setState(() {});
//                 },
//                 child: const Text('Select')),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future selectImage() {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0)), //this right here
//             child: Container(
//               height: 150,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Select Image From !',
//                       style: TextStyle(
//                           fontSize: 18.0, fontWeight: FontWeight.bold),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         GestureDetector(
//                           onTap: () async {
//                             selectedImagePath = await selectImageFromGallery();
//                             print('Image_Path:-');
//                             print(selectedImagePath);
//                             if (selectedImagePath != '') {
//                               Navigator.pop(context);
//                               setState(() {});
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                 content: Text("No Image Selected !"),
//                               ));
//                             }
//                           },
//                           child: Card(
//                               elevation: 5,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/gallery.png',
//                                       height: 60,
//                                       width: 60,
//                                     ),
//                                     Text('Gallery'),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                         GestureDetector(
//                           onTap: () async {
//                             selectedImagePath = await selectImageFromCamera();
//                             print('Image_Path:-');
//                             print(selectedImagePath);
//
//                             if (selectedImagePath != '') {
//                               Navigator.pop(context);
//                               setState(() {});
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                 content: Text("No Image Captured !"),
//                               ));
//                             }
//                           },
//                           child: Card(
//                               elevation: 5,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/camera.png',
//                                       height: 60,
//                                       width: 60,
//                                     ),
//                                     Text('Camera'),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
//   selectImageFromGallery() async {
//     XFile? file = await ImagePicker()
//         .pickImage(source: ImageSource.gallery, imageQuality: 10);
//     if (file != null) {
//       return file.path;
//     } else {
//       return '';
//     }
//   }
//
//   //
//   selectImageFromCamera() async {
//     XFile? file = await ImagePicker()
//         .pickImage(source: ImageSource.camera, imageQuality: 10);
//     if (file != null) {
//       return file.path;
//     } else {
//       return '';
//     }
//   }
//}