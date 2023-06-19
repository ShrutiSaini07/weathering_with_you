
import 'dart:convert';
import 'package:http/http.dart' as http;

class Worker{

  late String city;

  Worker({required this.city}){
    city = this.city;
  }

  late String name;
  late String desc;
  late String temp;
  late String air_speed;
  late String humidity;
  late String icon;

  Future<void> getAPIdata() async{

    try{
      var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=12f628abde50380237ef513cf540079f");
      http.Response response = await http.get(url);
      Map jsonData = jsonDecode(response.body);

      String getName = jsonData['name'];

      List weather = jsonData["weather"];
      Map weather_dict = weather[0];
      String weather_desc = weather_dict["description"];

      Map main = jsonData['main'];
      String getTemp = (main['temp'] - 273.15).toString();

      Map wind = jsonData['wind'];
      String getAir_speed = (wind['speed'] * 3.6).toString();

      String getHumidity = main['humidity'].toString();

      String getIcon = weather_dict["icon"].toString();

      name = getName;
      desc = weather_desc;
      temp = getTemp;
      air_speed = getAir_speed;
      humidity = getHumidity;
      icon = getIcon;

    }
    catch(e){
      name = "Invalid City";
      desc = "None";
      temp = "0";
      air_speed = "0";
      humidity = "0";
      icon = "02d";
    }




  }

}