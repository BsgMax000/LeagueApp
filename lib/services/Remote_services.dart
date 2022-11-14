import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:programmeren/models/champion.dart';

class RemoteService{
  Future<List<Champion>?> getChampions() async{
    var client = http.Client();

    var url = Uri.parse('http://ddragon.leagueoflegends.com/cdn/12.16.1/data/en_US/champion.json');
    var response = await client.get(url);

    if(response.statusCode == 200){
      Map<String, dynamic> data = json.decode(response.body);
      return getChampionData(data['data']);
    }
    else{
      return null;
    }
  }
}