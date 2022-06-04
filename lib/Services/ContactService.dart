import 'package:url_launcher/url_launcher.dart';

class ContactService{
  launchWhatsApp({
    required phoneNumber
  }) async {


    var wh="https://wa.me/+962$phoneNumber?text=Your Message here";

    if(await canLaunch(wh))
      await launch(wh);
  }

  launchTel({
    required phoneNumber
  }) async {


    var wh="tel:+962$phoneNumber";

    if(await canLaunch(wh))
      await launch(wh);
  }


}