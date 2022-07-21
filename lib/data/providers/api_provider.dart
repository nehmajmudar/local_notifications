import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:local_notifications/data/api_utils.dart';
import 'package:local_notifications/data/models/joke_model.dart';

class ApiProvider{
  Future<http.Response?> getJokes()async{
    try{
      http.Response response=await http.get(Uri.parse(ApiUtils.baseUrl));
      return response;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}