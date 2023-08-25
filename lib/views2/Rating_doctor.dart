import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views2/Recommendation_Screen.dart';
import 'package:get/get.dart';
import '../controller2/Rating_controller.dart';
import '../widgets2/loading.dart';
class Rating_doctor extends StatelessWidget {
 final not;
 final name1;

  Rating_doctor(this.not, this .name1,   {Key? key}) : super(key: key);
  static const id = 'rating_page'; // see GetMaterialApp for this usage
  CollectionReference info1ref = FirebaseFirestore.instance.collection("feedback");
  var feedback,name;
  GlobalKey<FormState> uniqustate = new GlobalKey<FormState>();
  addInfo1(context) async {
    var formdata =uniqustate.currentState;
    if (formdata!.validate()) {
      showLoading(context);
      formdata.save();
      await info1ref.add({
        "feedback":feedback,
        "name": name1.toString(),

      }).then((value) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Recommendation_screen();
        }));
      // Get.to(doctor1());
      }).catchError((e) {
        print("$e");
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,iconTheme: IconThemeData(color: Colors.blueGrey,size: 30)),
    body: ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top:10),
            child: Container(

              child: Center(child: Text("feedback for Dr",style:
              TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),),
              height: 60,
              width: Get.width/1.4,
              decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadiusDirectional.circular(30.0)),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top:50),
            child: ClipRRect(

            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
    topRight: Radius.circular(20),bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),

    child:Image.network(not,width: 200,height: 200,),
          ),)
        ),
        SizedBox(height: 20,),
        Center(child:Text("What should I change Myself ?",style:
        TextStyle(fontSize: 25,color: Colors.blueGrey,fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),)),
        SizedBox(height: 20,),
        _buildBody(),
        SizedBox(height: 30,),
        Text("Feedback :",style:
        TextStyle(fontSize: 25,color: Colors.blueGrey,
            ),),

        SizedBox(height: 10,),

        Container(
    child: Form(
    key: uniqustate,
    child: TextFormField(
          onSaved: (val) {
           feedback = val;
          },
           autocorrect: true,
        maxLines: 10,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.grey[200],
            filled: true,
            hintText: 'type here',
            hintStyle: TextStyle( fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.normal,),
          ),
          style: TextStyle( fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.normal,),
          validator: (value) =>
          value!.trim().isEmpty ? 'this field is required' : null,
        ),
    )
        ),
        SizedBox(height: 30),
        InkWell(
          child: Container(
            alignment: Alignment.bottomRight,
            child: MaterialButton(
                color: Colors.blueGrey,
                splashColor: Colors.white,
                height: 50,
                minWidth: Get.width/3 ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  'Submit',
                  style:  TextStyle( fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,),
                ),
                onPressed: () async {

                  await addInfo1(context);

                }),
          ),
        )
      ,
    ]));
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(5, (index) {
      return GetBuilder<RatingController>( // rebuilds when update() is called from GetX class
        builder: (controller) => Expanded(
          child: GestureDetector(
            child: controller.buildRatingStar(index),
            onTap: () {
              controller.updateAndStoreRating(index + 1); // +1 because index starts at 0 otherwise the star rating is offset by one
            },
          ),
        ),
      );
    });
    return Row(
      children: [
        Expanded(
          child: Row(
            children: stars,
          ),
        ),
      ],
    );
  }
}
