
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class locationServices {
  late LocationData _locationData;

  Future<LocationData?> sendLocationToDatabase(context)async{
    Location loc=new Location();
    bool _ServiceEnbled;
    PermissionStatus _PermissionGarante;

    _ServiceEnbled=await loc.serviceEnabled();
    if(!_ServiceEnbled) {
      _ServiceEnbled = await loc.requestService();
      if (_ServiceEnbled);
    }
    _PermissionGarante=await loc.hasPermission();
    if(_PermissionGarante==PermissionStatus.denied){
      _PermissionGarante=await loc.requestPermission();
      if(_PermissionGarante==PermissionStatus.granted);

    }
    _locationData=await loc.getLocation();
if(_locationData!=null){

  return _locationData;}

  }

  goToMap( {
  lati
  , longi})async{
    String mapLocationUrl="https://www.google.com/maps/search/?api=1&query=$longi,$lati";
  //  final String encodeUrl=Uri.decodeFull(mapLocationUrl);
    if(await canLaunch(mapLocationUrl))
      await launch(mapLocationUrl);
    else
      print('cant launch');
  }
 LocationData? get getloc=>_locationData;


}