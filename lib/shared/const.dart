import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/models/appointment.dart';
import 'package:pet_world/models/pet.dart';
import 'package:pet_world/models/petType.dart';
import 'package:pet_world/models/pet_owner.dart';
import 'package:pet_world/models/veterinarian.dart';
import 'package:pet_world/modules/PetWorld/petInfo.dart';

//logo
Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}
//input
TextFormField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextFormField(
    validator: (value){
      if(value!.isEmpty) return 'Must be Filled';
      else if(icon==Icons.phone_android) {

        var FTD = controller.text.substring(0, 2);
        if (controller.text.length != 9)
          return 'Not a PhoneNumber';
         else if ((FTD != '78' && FTD != '78' &&FTD != '79')) {

              return 'Not a PhoneNumber';

        }
      }
    },
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),

      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),

    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
//Button
Container UIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery
        .of(context)
        .size
        .width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300]!, blurRadius: 30, offset: Offset(0, 10))
];


Widget buildVetItem(context,doc)=>InkWell(
  child: Container(

    height: 240,
    padding: EdgeInsets.only(bottom: 10),
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(doc.data()['petImage']),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(top: 30),
              ),

            ],
          ),
        ),
        Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 60, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      doc.data()['name'],
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      doc.data()['city'],
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    ),
  ),
  onTap: (){

  },
);

Widget bulidReview( r)=>Container(
    child:Padding(
        padding: const EdgeInsets.all(10.0),
        child:  Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO2vBQ1vOla9pPM6M0ZsYZb7OckCS21cgN_Q&usqp=CAU'),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          r.PetOnerName.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children:
                          [
                            Expanded(
                              child: Text(
                                r.text.toString(),style: TextStyle(fontSize: 18.0,),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ])
              )
            ])
    ));
Widget buildVetWorkTime( day) {
  return Flexible(
      child:Flexible(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(

              decoration:  BoxDecoration(
                  color: Colors.grey[300],
                  boxShadow: shadowList,
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              height: 110,
              width: 110,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text(day.day.toString(),style: TextStyle(
                      fontWeight: FontWeight.w800,fontSize: 19.0),),
                  SizedBox(height: 10.0,),
                  Text(day.startTime!.hour.toString()+' : '+day.startTime!.minute.toString(),style: TextStyle(fontSize: 18.0),),
                  SizedBox(height: 10.0,),
                  Text(day.endTime!.hour.toString()+' : '+day.endTime!.minute.toString(),style: TextStyle(fontSize: 18.0),),
                ],
              ),
            ),
          )
      )
  );
}

Widget buildMyPets(pet p,context,veterinarian Vet,String petOwnerID )=>InkWell(
    onTap: (){ },
    child:  Container(
        child:Padding(
            padding: const EdgeInsets.all(10.0),
            child:  Row(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(20.0)) ,
                      boxShadow: shadowList,
                      image: DecorationImage(
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO2vBQ1vOla9pPM6M0ZsYZb7OckCS21cgN_Q&usqp=CAU'),
                        fit: BoxFit.cover,

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.name.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                                children:[
                                  Text('Gender:',
                                      style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800)),
                                  SizedBox(width: 10.0,),
                                  Text(p.gender.toString(),
                                      style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500)),
                                ]),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                                children:[
                                  Text('Age:',
                                      style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800)),
                                  SizedBox(width: 15.0,),
                                  Text(p.Age.toString(),
                                      style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500)),
                                ]),
                          ])
                  )
                ])
        )));
Widget buildMyPets1(pet p,context )=>InkWell(
   onTap: (){},
    child:  Container(
        child:Padding(
            padding: const EdgeInsets.all(10.0),
            child:  Row(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(20.0)) ,
                      boxShadow: shadowList,
                      image: DecorationImage(
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO2vBQ1vOla9pPM6M0ZsYZb7OckCS21cgN_Q&usqp=CAU'),
                        fit: BoxFit.cover,

                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.name.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                                children:[
                                  Text('Gender:',
                                      style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800)),
                                  SizedBox(width: 10.0,),
                                  Text(p.gender.toString(),
                                      style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500)),
                                ]),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                                children:[
                                  Text('Age:',
                                      style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800)),
                                  SizedBox(width: 15.0,),
                                  Text(p.Age.toString(),
                                      style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500)),
                                ]),
                          ])
                  )
                ])
        )));

Widget buildAppointmentForVet(appointment ap,pet p, pet_owner owner,context)=>
    Container(
    child:Padding(
        padding: const EdgeInsets.all(15.0),
        child:  Column(
            children: [
              Row(
                  children: [
                    Container(
                      width: 120.0,
                      height: 130.0,
                      decoration:BoxDecoration(
                        borderRadius:BorderRadius.all(Radius.circular(20.0)) ,
                        boxShadow: shadowList,
                        image: DecorationImage(
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO2vBQ1vOla9pPM6M0ZsYZb7OckCS21cgN_Q&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                owner.name.toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                  children:[
                                    Text('Name:',
                                        style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800)),
                                    SizedBox(width: 10.0,),
                                    Text(p.name.toString(),
                                        style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500)),
                                  ]),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                  children:[
                                    Text('Gender:',
                                        style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800)),
                                    SizedBox(width: 15.0,),
                                    Text(p.gender.toString(),
                                        style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500)),
                                  ]),
                              SizedBox(
                                height: 5.0,
                              ),
                            ])
                    )
                  ]),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [ Expanded(child:MaterialButton(onPressed: (){},child: Text('Done',style: TextStyle(fontSize: 16.0,color: Colors.white),),color:Colors.purple,)),
                  SizedBox(width: 10.0,),
                  Expanded(child:MaterialButton(onPressed: (){},child: Text('Cancel',style: TextStyle(fontSize: 16.0,color: Colors.black),),color: Colors.white60)),
                ],
              ),

            ]
        )
    ));
Widget buildPetBreed(petType p,context) {
  return InkWell(
    onTap:(){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>PetInfoScreen(p:p ,)));
    },
    child: Flexible(
        child:Padding(
          padding: const EdgeInsets.all(10),
          child:Stack(
              alignment:AlignmentDirectional.bottomStart,
              children:[ Container(
                decoration:   BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(p.image),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      color: Colors.white60,    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                height: 160,
                width: 160,
              ),
                Container(
                  width: 160.0,
                  decoration:   BoxDecoration(
                      color: Colors.purple,
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),

                  child: Text(p.bread,style: TextStyle(color: Colors.white,fontSize: 17.0),),
                ),
              ]),
        )
    ),
  );
}


Widget buildAppointmentForPetOwner(appointment ap,pet p, veterinarian vet)=>Container(
    child:Padding(
        padding: const EdgeInsets.all(15.0),
        child:  Column(
            children: [
              Row(
                  children: [
                    Container(
                      width: 120.0,
                      height: 120.0,
                      decoration:BoxDecoration(
                        borderRadius:BorderRadius.all(Radius.circular(20.0)) ,
                        boxShadow: shadowList,
                        image: DecorationImage(
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO2vBQ1vOla9pPM6M0ZsYZb7OckCS21cgN_Q&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vet.name.toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                  children:[
                                    Text('Name:',
                                        style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800)),
                                    SizedBox(width: 10.0,),
                                    Text(p.name.toString(),
                                        style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500)),
                                  ]),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                  children:[
                                    Text('Gender:',
                                        style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800)),
                                    SizedBox(width: 15.0,),
                                    Text(p.gender.toString(),
                                        style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500)),
                                  ]),
                              SizedBox(
                                height: 5.0,
                              ),
                            ])
                    )
                  ]),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [ Expanded(child:MaterialButton(onPressed: (){},child: Text('Done',style: TextStyle(fontSize: 16.0,color: Colors.white),),color:Colors.purple,)),
                  SizedBox(width: 10.0,),
                  Expanded(child:MaterialButton(onPressed: (){},child: Text('Cancel',style: TextStyle(fontSize: 16.0,color: Colors.black),),color: Colors.white60)),
                ],
              ),

            ]
        )
    ));
Widget buildMidicalRecordText(String s,)=>Row(
  children: [
    Icon(Icons.circle,color: Colors.black,size:12.0 ,),
    SizedBox(width: 10.0,),
    Text(s.toString(),style: TextStyle(color: Colors.black),),
  ],);











