import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
   
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Feature 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> albums = ['Album 1'];

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
    
      body: SingleChildScrollView(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                   albums.add('Album ${albums.length + 1}');
                });
              },
              child: Text('Add List Title'),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: albums.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: EdgeInsetsDirectional.symmetric(vertical: 5),
                  color: Colors.pinkAccent , 
                  child: ListTile(
                    leading:Icon(Icons.album),
                    title: Text('Album ${index +1}'),
                    subtitle: Text('album info'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        setState(() {
                          albums.removeAt(index);

                        });
                      }, 
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}