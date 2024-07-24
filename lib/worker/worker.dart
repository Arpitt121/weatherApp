import 'package:http/http.dart' as http;
import 'dart:convert';

class worker {
  //Constructor
  worker({required this.location}) {
    location = this.location;
  }

  String location;

  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? city;
  String? icon;

  //method =
  Future<void> getData() async {
    try {
      final response = await http.get(
      Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$location&appid=f6e66e765f1f91065abb3c962d569ae7'),
    );
    Map data = jsonDecode(response.body);

    //Getting Temp,Humidiy
    Map temp_data = data['main'];
    String getHumidity = temp_data['humidity'].toString();
    double getTemp = temp_data['temp'] -273.15;

//Getting air_speed
    Map wind = data['wind'];
    double getAir_speed = wind["speed"] / 0.27777777777778;

    //Getting Description
    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];
    String getMain_des = weather_main_data['main'];
    String getDesc = weather_main_data["description"];
    String getIcon = weather_main_data['icon'].toString();

   

    //Assigning Values
    temp = getTemp.toString();
    humidity = getHumidity;
    air_speed = getAir_speed.toString();
    description = getDesc;
    main = getMain_des;
     city = data['name'];
    icon = getIcon;
    }catch(e){
       temp = 'Na';
    humidity ='Na';
    air_speed = 'Na';
    description = 'Cant find data!';
    main = 'Na';
    icon = 'Na';
     city = 'Na';
    }
    
  }
}
