import 'package:flutter/material.dart';
import 'package:fortune_230221/fortune_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('오늘의 운세'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: fetchFortune(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
