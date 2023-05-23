import 'package:flutter/material.dart'; 
import 'api_service.dart'; 
import 'people_model.dart'; 

void main() { 
  runApp(MyApp()); 
} 

class MyApp extends StatelessWidget { 
  final ApiService apiService = ApiService();

  MyApp({super.key}); 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Flutter API Demo', 
      theme: ThemeData( 
        primarySwatch: Colors.blue, 
      ), 
      home: Scaffold( 
        appBar: AppBar( 
          title: const Text('Flutter API Demo'), 
        ), 
        body: FutureBuilder<List<People>>( 
          future: apiService.getPeople(),
          builder: (BuildContext context, AsyncSnapshot<List<People>> snapshot) { 
            if (snapshot.hasError) { 
              return const Text("An error occurred"); 
            } else if (snapshot.hasData) { 
              return ListView.builder( 
                itemCount: snapshot.data?.length, 
                itemBuilder: (context, index) { 
                  return ListTile( 
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].email),
                  ); 
                }, 
              ); 
            } else { 
              return const CircularProgressIndicator(); 
            } 
          }, 
        ), 
      ), 
    ); 
  } 
} 