import 'package:flutter/material.dart';
import 'package:pet_world/models/petType.dart';
class PetInfoScreen extends StatelessWidget {
  final petType p;
  PetInfoScreen({required this.p});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Breed Info',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center( child:Container(
              height: 240,
              padding: EdgeInsets.only(bottom: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(p.image),
                  fit: BoxFit.fill,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),),
            SizedBox(height: 20.0,),
            Text(p.bread,style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w800),maxLines: 2,),
            SizedBox(height: 10.0,),
            Text(p.Text,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400),maxLines: 120,),

          ],
        ),
      ),
    );
  }
}
