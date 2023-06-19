
import 'package:flutter/material.dart';
import 'package:weathering_with_you/Activity/home.dart';
import 'package:weathering_with_you/Activity/loading.dart';
import 'package:weathering_with_you/Activity/location.dart';



void main(){
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home": (context) => Home(),
      "/loading" : (context) => Loading(),
      "/location" : (context) => Location(),
    },
  ));
}
