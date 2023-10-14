import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getNasaData() async {
  Uri url = Uri.parse('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=100&api_key=eQnprvXukgfNomTanZiHT1DqLApcABzFjI350dyZ');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  }
  else {
    throw Exception('Error ${response.reasonPhrase}');
  }
}