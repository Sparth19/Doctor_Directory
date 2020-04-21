import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models.dart';

class Services {
  static const String url =
      "https://api.betterdoctor.com/2016-03-01/doctors?location=37.773%2C-122.413%2C100&user_location=37.773%2C-122.413&skip=0&limit=100&user_key=e258adc49990895fcae371bcb6522be4";

  static Future getDetails(http.Client client) async {
    final response = await client.get(url);
    if (response.statusCode == 200) {
      List<Data> list = parseDetails(response.body);
      return list;
    } else {
      throw Exception("Error");
    }
  }

  static List<Data> parseDetails(String responseBody) {
    final parsed = json.decode(responseBody);
    var list = parsed['data'] as List;
    List<Data> datalist = list.map((i) => Data.fromJson(i)).toList();
    List<Data> output = new List();
    /*for(var i=0;i<datalist.length;i++){
      if(datalist[i].specialties.length!=0){
        output.add(datalist[i]);
      }
    }*/
    return datalist;
  }
}
