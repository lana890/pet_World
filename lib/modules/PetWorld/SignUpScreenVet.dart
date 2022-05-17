import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:pet_world/Services/FirebaseRegister.dart';
import 'package:pet_world/Services/locationServices.dart';
import 'package:pet_world/colors/colors.dart';
import 'package:pet_world/modules/PetWorld/HomeScreenvet.dart';
import 'package:pet_world/modules/PetWorld/signin_Screen.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';

class SignUpScreenVet extends StatefulWidget {
  const SignUpScreenVet({Key? key}) : super(key: key);

  @override
  State<SignUpScreenVet> createState() => _SignUpScreenVetState();
}

class _SignUpScreenVetState extends State<SignUpScreenVet> {
  late  LocationData d;
  late String location;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _PhoneNumberTextController = TextEditingController();
  TextEditingController _CliniNameTextController = TextEditingController();
  TextEditingController _ExperienceTextController = TextEditingController();

  Future<void> Checking() async {
    if (_formKey.currentState!.validate()&&d!=null) {
      var retrn = await (FirebaseRegister().SignUpVet(
        experience: _ExperienceTextController.text,
        lati:d.latitude!.toDouble(),
        longi:d.longitude!.toDouble(),
        email: _emailTextController.text,
        password: _passwordTextController.text,
        username: _userNameTextController.text,
        phoneNumber: _PhoneNumberTextController.text,
        ClinicName:_CliniNameTextController.text,


      )).then((value){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SigninScreen()));
      }
      );

    }
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField(
                            "Enter UserName", Icons.person_outline, false,
                            _userNameTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField(
                            "Enter Email Id", Icons.email, false,
                            _emailTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField(
                            "Enter Password", Icons.lock, true,
                            _passwordTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField(
                            "Enter Clinic Name", Icons.local_hospital, false,
                            _CliniNameTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField(
                            "Enter Experience", Icons.local_hospital, false,
                            _ExperienceTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextField(
                            "Enter PhoneNumber", Icons.phone_android, false,
                            _PhoneNumberTextController),

                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(

                          onTap: () async {
                            (await locationServices().sendLocationToDatabase(context).then((value) {
                              d=value!;
                              getAddress(value!).then((value) => context.read<UserProvider>().setLoc(location));

                            }))!;
                          },

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                  Icons.location_on_outlined
                              ),
                              SizedBox( width: 2,),
                              Text(
                                " Get Your Current Location",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            '${context.watch<UserProvider>().loc}'

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        UIButton(context, "Sign Up", Checking)

                      ],

                    ),
                  )
              )
          ),
        )

    );

  }
  Future<void> getAddress(LocationData d) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          d.latitude!.toDouble(),
          d.longitude!.toDouble()
      );

      Placemark place = placemarks[0];


      location=("${place.street}");

    } catch (e) {
      print(e);
    }
  }
}




