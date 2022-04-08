import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/generated_code/client_index.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';
import '../entermodal.dart';
import 'package:chopper/chopper.dart' as chopper;

class ZooMainView extends StatelessWidget {
  const ZooMainView({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const ZooMainPage(title: 'Aalborg Zoo Dyr'),
    );
  }
}

class ZooMainPage extends StatefulWidget {
  const ZooMainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ZooMainPage> createState() => _ZooPageState();
}

class _ZooPageState extends State<ZooMainPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final zooApi = Zooinator.create(
        baseUrl: Platform.isAndroid
            ? "https://10.0.2.2:5000"
            : "https://localhost:5000");
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child:Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child:
              FutureBuilder<chopper.Response<ZooInparkContractsAnimalOverview>>(
                  future: zooApi.animalsOverviewGet(),
                  builder: (BuildContext context,
                      AsyncSnapshot<chopper
                                  .Response<ZooInparkContractsAnimalOverview>>
                          snapshot) {
                    if (snapshot.hasData) {
                      final List<Widget> rows = snapshot.data?.body?.animals
                          ?.map((animal) => Center(
                                child: Column(
                                  children: [
                                    const Padding(padding: EdgeInsets.all(5)),
                                    Text(animal.name!.displayName!,
                                      style: TextStyle(fontSize: 20),),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    Image.network(
                                      animal.image!.previewUrl!,
                                      width: 350,
                                    ),
                                    const Padding(padding: EdgeInsets.all(15))
                                  ],
                                ),
                              ))
                          .toList() as List<Widget>;

                      return Scrollbar(
                          isAlwaysShown: true,
                          hoverThickness: 300,
                          showTrackOnHover: true,
                          child: ListView(children: rows));
                    }

                    return const Text("oof");
                  })),
      // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
