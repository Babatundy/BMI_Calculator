import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*class JasonParsing extends StatefulWidget {
  @override
  _JasonParsingState createState() => _JasonParsingState();
}

class _JasonParsingState extends State<JasonParsing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chkopi"),
      ),
    );
  }
}*/
Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', '/todos'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

/* "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"*/
class Album {
  //final int albumId;
  final int id;
  //final String url;
  //final String thumbnailUrl;
  final bool completed;
  final String title;
  final int userId;

  Album({@required this.userId, @required this.id, @required this.title,@required this.completed});

  factory Album.fromJson(List<dynamic> json) {
    return Album(
      userId: json[1]['userId'],
      id: json[1]['id'],
      title: json[1]['title'],
      completed: json[1]['completed']
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapsho) {
              if (snapsho.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapsho.data.title),
                   // Text(snapsho.data.url),
                    //Text(snapsho.data.thumbnailUrl),
                    Text(snapsho.data.id.toString()),
                    Text(snapsho.data.userId.toString()),
                    Text(snapsho.data.completed.toString()),
                  ],
                );
              } else if (snapsho.hasError) {
                return Text("${snapsho.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
