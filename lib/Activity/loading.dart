import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weathering_with_you/worker/worker.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  var city_name = "loading";

  void startApp(String city_name) async{

    Worker roorkee = Worker(city: city_name);
    await roorkee.getAPIdata();

    print("Name : "+roorkee.name);

    setState(() {
      city_name=roorkee.name;
    });

    print("Description : "+roorkee.desc);
    print("Windspeed : "+roorkee.air_speed);
    print("Temperature : "+roorkee.temp);
    print("Humidity : "+roorkee.humidity);
    print("Icon : "+roorkee.icon);

    Future.delayed(Duration(seconds: 1), (){
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "keyName" : roorkee.name,
        "keyDesc" : roorkee.desc,
        "keyWindspeed" : roorkee.air_speed,
        "keyTemp" : roorkee.temp,
        "keyHumidity" : roorkee.humidity,
        "keyIcon" : roorkee.icon,
      });
    });

  }

  @override
  void initState() {
    super.initState();

    print("init called");

  }

  @override
  Widget build(BuildContext context) {
    final homeMap = ModalRoute.of(context)!.settings.arguments as Map?;

    if (homeMap?.isNotEmpty ?? false){
      city_name = homeMap?['searchData'];
    }
    else{
      city_name = "Delhi";
    }
    startApp(city_name);

    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Lottie.asset('assets/lottie/backgroung.json',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 600,),
                  SpinKitWaveSpinner(
                    color: Colors.grey,
                    size: 50.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Weathering With You",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade300,
                        fontFamily: 'SpaceGrotesk'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "By Shruti Saini",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white10,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'SpaceGrotesk'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
