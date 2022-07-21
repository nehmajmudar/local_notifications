import 'dart:convert';

import 'package:local_notifications/data/models/joke_model.dart';
import 'package:local_notifications/data/providers/api_provider.dart';
import 'package:http/http.dart' as http;

class JokeRepository{
  final ApiProvider apiProvider=ApiProvider();

  Future<JokeModel?> getJokeApi()async{
    final http.Response? jokeDataResponse=await apiProvider.getJokes();
    if(jokeDataResponse!.statusCode==200){
      Map<String, dynamic> mapResponse = json.decode(jokeDataResponse.body);
      return JokeModel.fromJson(mapResponse);
    }
    else{
      print(jokeDataResponse.statusCode);
      return null;
    }
  }
}