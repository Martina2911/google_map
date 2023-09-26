import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController{
  GoogleMapController? googleMapController ;
  Position? currentPosition;

  static const CameraPosition kGooglePlex =
  CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  static const CameraPosition kLake =
  CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(30.093298, 31.251038),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414
  );

  @override
  void onInit() {
    // TODO: implement onInit
    getCurrentLocation();
    super.onInit();
  }
  getCurrentLocation() async {  // get your position LatLng(37.433888865432614, -122.08418861031532)
    try {

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      currentPosition = position;
      update();
      goToCurrentLocation();
    } catch (e) {
      print(e);
    }
  }

  goToCurrentLocation()  {
    if(currentPosition!=null && googleMapController !=null){
      googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(currentPosition!.latitude , currentPosition!.longitude),
            zoom: 20),

      ));
    }else{
      print('no');
    }
  }

  goToTheLake() async {
    await googleMapController?.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  goToGoogle() async {
    await googleMapController?.animateCamera(CameraUpdate.newCameraPosition(kGooglePlex));
  }
}