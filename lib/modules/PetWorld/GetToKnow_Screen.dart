import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/modules/PetWorld/CatsScreen.dart';
import 'package:pet_world/modules/PetWorld/DogsScreen.dart';
import 'package:pet_world/modules/PetWorld/birds.dart';
import 'package:pet_world/modules/PetWorld/fish.dart';
import 'package:pet_world/modules/PetWorld/hamster.dart';
import 'package:pet_world/modules/PetWorld/rabbit.dart';

class GetToKnow extends StatelessWidget {
  const GetToKnow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
    child: Column(
    children: [
    Row(children: [
    InkWell(
    onTap:(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>CatsScreen()));
    },
    child: Flexible(
    child:Padding(
    padding: const EdgeInsets.all(10),
    child:Stack(
    alignment:AlignmentDirectional.bottomStart,
    children:[ Container(
    decoration:   BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo6vBPDWVQM1LsFuqzyb_YmlfdaazmwMOMIw&usqp=CAU'),
    fit: BoxFit.fill,
    ),
    border: Border.all(
    color: Colors.white60    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    height: 150,
    width: 150,
    ),
    Container(
    width: 150.0,
    decoration:   BoxDecoration(
    color: Colors.purple,
    border: Border.all(),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),

    child: Text(' Cats',style: TextStyle(color: Colors.white,fontSize: 18.0),),
    ),
    ]),
    )
    ),
    ),
    SizedBox(width: 10,),
    InkWell(
    onTap:(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>DogsScreen()));
    },
    child: Flexible(
    child:Padding(
    padding: const EdgeInsets.all(10),
    child:Stack(
    alignment:AlignmentDirectional.bottomStart,
    children:[ Container(
    decoration:   BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4GCtZMzmnVwuqdgNzniwrRQhYuPHXziD8TQ&usqp=CAU'),
    fit: BoxFit.fill,
    ),
    border: Border.all(
    color: Colors.white60    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    height: 150,
    width: 150,
    ),
    Container(
    width: 150.0,
    decoration:   BoxDecoration(
    color: Colors.purple,
    border: Border.all(),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),

    child: Text(' Dogs',style: TextStyle(color: Colors.white,fontSize: 18.0),),
    ),
    ]),
    )
    ),
    ),
    ],),
    Row(children: [
    InkWell(
    onTap:(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>birdsScreen()));
    },
    child: Flexible(
    child:Padding(
    padding: const EdgeInsets.all(10),
    child:Stack(
    alignment:AlignmentDirectional.bottomStart,
    children:[ Container(
    decoration:   BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjkn_yxOwqdLFtjVD2s-kscMCcqicAAsXTag&usqp=CAU'),
    fit: BoxFit.fill,
    ),
    border: Border.all(
    color: Colors.white60    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    height: 150,
    width: 150,
    ),
    Container(
    width: 150.0,
    decoration:   BoxDecoration(
    color: Colors.purple,
    border: Border.all(),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),

    child: Text(' Birds',style: TextStyle(color: Colors.white,fontSize: 18.0),),
    ),
    ]),
    )
    ),
    ),
    SizedBox(width: 10,),
    InkWell(
    onTap:(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>RabbitScreen()));
    },
    child: Flexible(
    child:Padding(
    padding: const EdgeInsets.all(10),
    child:Stack(
    alignment:AlignmentDirectional.bottomStart,
    children:[ Container(
    decoration:   BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt3HTa1fDRQEy7rWGxWHu7m9JfeXjVWTLitw&usqp=CAU'),
    fit: BoxFit.fill,
    ),
    border: Border.all(
    color: Colors.white60    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    height: 150,
    width: 150,
    ),
    Container(
    width: 150.0,
    decoration:   BoxDecoration(
    color: Colors.purple,
    border: Border.all(),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),

    child: Text(' Rabbit',style: TextStyle(color: Colors.white,fontSize: 18.0),),
    ),
    ]),
    )
    ),
    ),
    ] ),

    Row(children: [
    InkWell(
    onTap:(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>FishScreen()));
    },
    child: Flexible(
    child:Padding(
    padding: const EdgeInsets.all(10),
    child:Stack(
    alignment:AlignmentDirectional.bottomStart,
    children:[ Container(
    decoration:   BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPwJO8asJavyWjO2ZyG3bD-Qgvq2hgsMI3EA&usqp=CAU'),
    fit: BoxFit.fill,
    ),
    border: Border.all(
    color: Colors.white60    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    height: 150,
    width: 150,
    ),
    Container(
    width: 150.0,
    decoration:   BoxDecoration(
    color: Colors.purple,
    border: Border.all(),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),

    child: Text(' Fish',style: TextStyle(color: Colors.white,fontSize: 18.0),),
    ),
    ]),
    )
    ),
    ),
    SizedBox(width: 10,),
    InkWell(
    onTap:(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>hamistarScreen()));
    },
    child: Flexible(
    child:Padding(
    padding: const EdgeInsets.all(10),
    child:Stack(
    alignment:AlignmentDirectional.bottomStart,
    children:[ Container(
    decoration:   BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ1YCSMdW0EvNg3wDoA566M17esGZYCtOhrQ&usqp=CAU'),
    fit: BoxFit.fill,
    ),
    border: Border.all(
    color: Colors.white60    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    height: 150,
    width: 150,
    ),
    Container(
    width: 150.0,
    decoration:   BoxDecoration(
    color: Colors.purple,
    border: Border.all(),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),

    child: Text(' Hamestar',style: TextStyle(color: Colors.white,fontSize: 18.0),),
    ),
    ]),
    )
    ),
    ),
    ],),
    ],
    ),));
  }
}
