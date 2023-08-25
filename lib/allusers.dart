// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class All_ussers extends StatefulWidget {
//   const All_ussers({Key? key}) : super(key: key);
//   @override
//   _All_ussersState createState() => _All_ussersState();
// }
// class _All_ussersState extends State<All_ussers> {
//   final controller=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("all users"),),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: (){
//           Get.toNamed("UserPage");
//         },
//       ),
//       body: StreamBuilder<List<User>>(stream: readUsers(),
//         builder: (context,snapshot){
//           if(snapshot.hasData){
//             final users1 =snapshot.data!;
//             return ListView(
//               children: users1.map(buildUser).toList(),
//             );
//           }
//           else if (snapshot.hasError){
//             print("gg ${snapshot.error}");
//             return Text("gg ${snapshot.error}");
//
//           }
//           else{
//             return Center(child: Text("loading"),);
//           }
//         },),
//     );
//   }
//   // FutureBuilder(
//   // future:inforeef.get().id,
//   // builder: (BuildContext context, snapshot) {
//   // if (snapshot.connectionState == ConnectionState.done) {
//   // String userID = snapshot.data;
//   // _userDetails(userID);
//   // return new Text(firstName);
//   // }
//   // else {
//   // return new Text('Loading...');
//   // }
//   // },
//   // ),
//   Widget buildUser(User users1)=>ListTile(
//     leading: CircleAvatar(child: Text("${users1.age}"),),
//     title: Text(users1.name!),
//   );
//   Stream<List<User>>readUsers()=> FirebaseFirestore.instance.collection("users1").snapshots().map((snapshot) =>
//       snapshot.docs.map((doc)=>User.fromJson(doc.data())).toList());
// }
// class User{
//   String ? id;
//   final String ? name;
//   final int ?age;
//   User({
//     this.id ='',
//     required this.name,
//     required this.age,
//   });
//   Map<String,dynamic>toJson()=>{
//     "id":id,
//     "name":name,
//     "age":age,
//   };
//   static User fromJson(Map<String,dynamic>json)=>User(
//     id:json['id'],
//     name:json['name'],
//     age:json['age'],
//   );
// }

import 'package:flutter_app/views2/stage0.dart';
import 'package:flutter_app/views2/stage1_screen.dart';
import 'package:flutter_app/views2/stage2_screen.dart';
import 'package:flutter_app/views2/stage3_screen.dart';
import 'package:flutter_app/views2/stage4_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
class two2 extends StatefulWidget {
  const two2({Key? key}) : super(key: key);

  @override
  _two2State createState() => _two2State();
}

class _two2State extends State<two2> {
var result;
  File? selectedImage;
  var responseJson;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: [
          selectedImage==null?Text("enter image"):Image.file(selectedImage!)
          ,
          TextButton.icon(onPressed:uploudImage , icon: Icon(Icons.done), label: Text("uploud")),
          TextButton.icon(onPressed:() {

            if("${result}"==0.toString()){
              Get.to(stage0());
            }else if("${result}"==1.toString()){
              Get.to(stage1());
            }else if("${result}"==2.toString()){
              Get.to(stage2());

          }else if("${result}"==3.toString()){
      Get.to(stage3());

  }else if("${result}"==4.toString()){
Get.to(stage4());
}
            else(){
              Get.to(stage0());
             };
          }, icon: Icon(Icons.done), label: Text("uploud1"))
         ,Text("data :${result}",style: TextStyle(fontSize: 40,color: Colors.black87),),

         // Text("data :${result}",style: TextStyle(fontSize: 40,color: Colors.black87),)
        ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.add),
      ),
    );
  }
uploudImage()async{
  final request=  http.MultipartRequest(
      'POST',Uri.parse("http://10.0.2.2:5000/predict"));

  Map<String,String> headers={"Content-type":"multipart/form-data"};
  request.files.add(http.MultipartFile('file',selectedImage!.readAsBytes().asStream(),
      selectedImage!.lengthSync(), filename:selectedImage!.path.split('/').last
  ));
  print(selectedImage);
  print(selectedImage!.path.split('.').last);
  request.headers.addAll(headers);
  print(request.toString());

  print(selectedImage!.readAsBytes().asStream().toString());
  final res =await request.send();
  var responseData=await res.stream.bytesToString();
  setState(() {
    result=jsonDecode(responseData)['class'];
  });

  print("re "+result.toString());
  print(res.statusCode);}
  //
  // var _responseJson = await res.stream.transform(utf8.decoder).join();
  // setState(() {
  //   responseJson=_responseJson;
  // });
  // print(_responseJson);
//   // var responseData = jsonDecode(responseJson);
//   // var apiResponse = ApiResponse.fromJson(responseData);
//   // print(apiResponse);
//   // return apiResponse;
//
//   // https.Response response= await https.Response.fromStream(res);
//   // setState(() {
//   //   final resjson=jsonEncode(res.body);
//   // });
//
//   print(res.statusCode);
//   // final response = await https.get(Uri.parse("http://10.0.2.2:5000/predict")); //getting the response from our backend server script
//   //
//   // final decoded = json.decode(res.body) ;//converting it from json to key value pair
//   //
//   // setState(() {
//   //   message = decoded['result']; //changing the state of our widget on data update
//   // });
//   // print(message);
//   //     https.Response response =await https.Response.fromStream(res);
//   //   final resJson = jsonDecode(response.body);
//   // message = resJson["result"];
//   //   print( message);
//   //   http.Response response =await http.Response.fromStream(res);
//   //   final resJson = jsonDecode(response.body);
//   // final message = resJson["result"];
//   //print(message);
//   // Map<String,String>headers1={
//   //   "Content-type":'application/json',
//   //   'Charset':'utf-8'
//   // };
//   // http.Response response=await http.get(Uri.parse("http://10.0.2.2:5000/predict"),headers: headers1);
//   //  if(res.statusCode==200){
//   //    print(res.statusCode);
//   //    print(json.decode(res.toString()));
//   //    print("${res.toString()}");
//   //    final decoded = await json.decode(response.body) as Map<String, dynamic>;
//   //
//   //    setState(() {
//   //      _response = decoded['result'];
//   //      print(_response.toString());
//   //     // data=json.decode(response.body).toString();
//   //    });
// }
// // setState(()async {
// //   var data1 = await json.decode(json.encode(response.body));
// //   data=data1["result"].toString();
// //   print(data1['result'].toString());
// //   // String jsonsDataString= response.body.toString().replaceAll("\n", "");
// //   // data=jsonDecode(jsonsDataString);
// //   // print(data.toString());
// //});



// uploudImage()async{
  //   var request = http.MultipartRequest(
  //     'POST',
  //     Uri.parse('http://10.0.2.2:5000/predict'),
  //   );
  //   request.files
  //       .add(await http.MultipartFile.fromPath('file', selectedImage!.path));
  //
  //   var response = await request.send();
  //   print(response.statusCode);
  //   var data = await response.stream.bytesToString();
  //    result = jsonDecode(data)['class'];
  // // var responseData = jsonDecode(responseJson);
  // // var apiResponse = ApiResponse.fromJson(responseData);
  // // print(apiResponse);
  // // return apiResponse;
  //
  //   // https.Response response= await https.Response.fromStream(res);
  //   // setState(() {
  //   //   final resjson=jsonEncode(res.body);
  //   // });
  //
  //   //print(res.statusCode);
  // // final response = await https.get(Uri.parse("http://10.0.2.2:5000/predict")); //getting the response from our backend server script
  // //
  // // final decoded = json.decode(res.body) ;//converting it from json to key value pair
  // //
  // // setState(() {
  //   message = decoded['result']; //changing the state of our widget on data update
  // });
  // print(message);
  //     https.Response response =await https.Response.fromStream(res);
  //   final resJson = jsonDecode(response.body);
  // message = resJson["result"];
  //   print( message);
  //   http.Response response =await http.Response.fromStream(res);
  //   final resJson = jsonDecode(response.body);
  // final message = resJson["result"];
    //print(message);
    // Map<String,String>headers1={
    //   "Content-type":'application/json',
    //   'Charset':'utf-8'
    // };
   // http.Response response=await http.get(Uri.parse("http://10.0.2.2:5000/predict"),headers: headers1);
   //  if(res.statusCode==200){
   //    print(res.statusCode);
   //    print(json.decode(res.toString()));
   //    print("${res.toString()}");
   //    final decoded = await json.decode(response.body) as Map<String, dynamic>;
   //
   //    setState(() {
   //      _response = decoded['result'];
   //      print(_response.toString());
   //     // data=json.decode(response.body).toString();
   //    });
    //}
// setState(()async {
//   var data1 = await json.decode(json.encode(response.body));
//   data=data1["result"].toString();
//   print(data1['result'].toString());
//   // String jsonsDataString= response.body.toString().replaceAll("\n", "");
//   // data=jsonDecode(jsonsDataString);
//   // print(data.toString());
//});



  // Future<void> uploudImage()async{
  //
  //   var stream = https.ByteStream(selectedImage!.openRead());
  //   stream.cast();
  //   var length= await selectedImage!.length();
  //   var uri= Uri.parse("http://10.0.2.2:5000/predict");
  //   var request = await https.MultipartRequest('POST',uri);
  //   // request.fields["result"]=massege!;
  //   var multport=https.MultipartFile('file',stream,length,filename: selectedImage!.path);
  //   request.files.add(multport);
  //   var response= await request.send();
  //   // var result=await response.stream.bytesToString();
  //   // final Map<String,dynamic>resonsejson=json.decode(result.toString())as Map<String,dynamic>;
  //
  //
  //   //var response= await http.Response.fromStream(streamedResponse);
  //
  //   print(response.statusCode);
  //   // print(await response.stream.transform(utf8.decoder).join());
  //   //print(response);
  //
  // }
  // Future<void>_getData()async{
  //   var response=await http.get(Uri.parse("http://10.0.2.2:5000/predict"));
  //   var data = jsonDecode(response.body)['result'];
  //   setState(() {
  //     _data=data;
  //   });
  // }
  Future getImage() async{
    final pickedImage=await ImagePicker().getImage(source: ImageSource.gallery,maxHeight: 320,maxWidth: 320);

    setState(() {
      selectedImage=File(pickedImage!.path);
    });
  }

}

// class ApiResponse {
//   String ?result;
//
//
//   ApiResponse({this.result, });
//
//   factory ApiResponse.fromJson(Map<String, dynamic> json) {
//     return ApiResponse(
//       result: json['result'],
//
//     );
//   }}
// uploudImage()async{
//   final request=  http.MultipartRequest(
//       'POST',Uri.parse("http://10.0.2.2:5000/predict"));
//
//   Map<String,String> headers={"Content-type":"multipart/form-data"};
//   request.files.add(http.MultipartFile('file',selectedImage!.readAsBytes().asStream(),
//       selectedImage!.lengthSync(), filename:selectedImage!.path.split('.').last
//   ));
//   print(selectedImage);
//   print(selectedImage!.path.split('.').last);
//   request.headers.addAll(headers);
//   print(request.toString());
//
//   print(selectedImage!.readAsBytes().asStream().toString());
//   final res =await request.send();
//   // var responseData=await res.stream.bytesToString();
//   // var result=jsonDecode(responseData)['result'];
//   // print("re"+result.toString());
//   print(res.statusCode);
//
//   var _responseJson = await res.stream.transform(utf8.decoder).join();
//   setState(() {
//     responseJson=_responseJson;
//   });
//   print(_responseJson);
//   // var responseData = jsonDecode(responseJson);
//   // var apiResponse = ApiResponse.fromJson(responseData);
//   // print(apiResponse);
//   // return apiResponse;
//
//   // https.Response response= await https.Response.fromStream(res);
//   // setState(() {
//   //   final resjson=jsonEncode(res.body);
//   // });
//
//   print(res.statusCode);
//   // final response = await https.get(Uri.parse("http://10.0.2.2:5000/predict")); //getting the response from our backend server script
//   //
//   // final decoded = json.decode(res.body) ;//converting it from json to key value pair
//   //
//   // setState(() {
//   //   message = decoded['result']; //changing the state of our widget on data update
//   // });
//   // print(message);
//   //     https.Response response =await https.Response.fromStream(res);
//   //   final resJson = jsonDecode(response.body);
//   // message = resJson["result"];
//   //   print( message);
//   //   http.Response response =await http.Response.fromStream(res);
//   //   final resJson = jsonDecode(response.body);
//   // final message = resJson["result"];
//   //print(message);
//   // Map<String,String>headers1={
//   //   "Content-type":'application/json',
//   //   'Charset':'utf-8'
//   // };
//   // http.Response response=await http.get(Uri.parse("http://10.0.2.2:5000/predict"),headers: headers1);
//   //  if(res.statusCode==200){
//   //    print(res.statusCode);
//   //    print(json.decode(res.toString()));
//   //    print("${res.toString()}");
//   //    final decoded = await json.decode(response.body) as Map<String, dynamic>;
//   //
//   //    setState(() {
//   //      _response = decoded['result'];
//   //      print(_response.toString());
//   //     // data=json.decode(response.body).toString();
//   //    });
// }
// // setState(()async {
// //   var data1 = await json.decode(json.encode(response.body));
// //   data=data1["result"].toString();
// //   print(data1['result'].toString());
// //   // String jsonsDataString= response.body.toString().replaceAll("\n", "");
// //   // data=jsonDecode(jsonsDataString);
// //   // print(data.toString());
// //});


