import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/shared/const.dart';

class USERAppointments extends StatelessWidget {
  const USERAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                                    "Petow",
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
                                        Text("Name",
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
                                        Text("Female",
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
                    [ Expanded(child:
                    MaterialButton(onPressed: (){},child: Text('Done',style: TextStyle(fontSize: 16.0,color: Colors.white),),color:Colors.purple,)),
                      SizedBox(width: 10.0,),
                      Expanded(child:MaterialButton(onPressed: (){},child: Text('Cancel',style: TextStyle(fontSize: 16.0,color: Colors.black),),color: Colors.white60)),
                    ],
                  ),

                ]
            )
        ));
  }
}
