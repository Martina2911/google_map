import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'mapController.dart';

class MapSample2 extends StatelessWidget {
  final MapController mapController=MapController();
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<MapController>(
          init: MapController(),
          builder: (mapController) {
            return
              Scaffold(
                  appBar: AppBar(title: Text("Map using Getx"),backgroundColor: Colors.blueGrey,),
                  body:Stack(children:
                  [
                    GoogleMap(
                      markers: mapController.currentPosition !=null?{
                        Marker(markerId: MarkerId('1'),
                            position: LatLng(mapController.currentPosition!.latitude, mapController.currentPosition!.longitude,)),
                        Marker(markerId: MarkerId('2'),
                          position:LatLng(MapController.kLake.target.latitude,MapController.kLake!.target.longitude),),
                        Marker(markerId: MarkerId('3'),
                          position:LatLng(MapController.kGooglePlex!.target.latitude,MapController.kGooglePlex!.target.longitude),),
                      }:{},
                      mapType: MapType.normal,
                      initialCameraPosition: MapController.kGooglePlex,
                      onMapCreated: (gController) {
                        mapController.googleMapController = gController;
                        mapController.goToCurrentLocation();
                      },
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:[
                          Row(
                            children: [
                              SizedBox(width: 330,),
                              GestureDetector(
                                onTap: mapController.goToGoogle,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(Radius.circular(3)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5), // Set the shadow color
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Icon(Icons.location_on_outlined,size: 35,color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              SizedBox(width: 330,),
                              GestureDetector(
                                onTap: mapController.goToTheLake,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.all(Radius.circular(3)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5), // Set the shadow color
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Icon(Icons.location_on_outlined,size: 35,color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 100,),
                        ]),

                  ]),
                  floatingActionButton: FloatingActionButton.extended(
                    onPressed: mapController.goToCurrentLocation,
                    label: const Text('To Home!'),
                    icon: const Icon(Icons.directions_boat),
                  )
              );
          });


  }}
