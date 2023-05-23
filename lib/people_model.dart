class People { 
  final int id;
  final String name;
  final String email; 
  final String body; 

  People({required this.id, required this.name, required this.email, required this.body}); 

  factory People.fromJson(Map<String, dynamic> json) { 
    return People( 
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'], 
    ); 
    }
    }