import 'dart:convert';
import 'dart:developer';

import 'package:covid_19/Model/WorldStatesModel.dart';
import 'package:covid_19/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {

  Future<WorldStatesModel> fetchWorldStatesRecords() async{
    try{
      final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
      log(response.body);
        return WorldStatesModel.fromJson(data);
      }
      else {
          throw Exception('Error');
      }
    } catch(e){
      print(e.toString());
      throw Exception(e.toString());
    }
  }

static Future<List<dynamic>> countriesListApi() async{
    try{
      final response = await http.get(Uri.parse(AppUrl.countriesList));
      var data;
      if(response.statusCode == 200){
        // log(response.body);
        data= jsonDecode(response.body);

        return data;
      }else{
        return data;
      }


    } catch(e){
      throw Exception(e.toString());
    }
}

}
