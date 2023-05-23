import 'dart:convert'; 
import 'package:http/http.dart' as http; 
import 'people_model.dart';

class ApiService { 
  final String baseUrl = "https://jsonplaceholder.typicode.com/comments"; 

  Future<List<People>> getPeople() async { 
    final response = await http.get(Uri.parse(baseUrl)); 

    if (response.statusCode == 200) { 
      List jsonResponse = json.decode(response.body); 
      List<People> people = jsonResponse.map((item) => People.fromJson(item)).toList(); 

      return people;
    } else { 
      throw Exception("Failed to load posts"); 
    } 
  } 
}