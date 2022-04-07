import 'package:flutter/material.dart';
import 'package:flutter_app/zoomain.dart';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Enter Zoo'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Enter the coolest Zoo ever!',
                      style: TextStyle(color: Colors.white)),
                      const SizedBox(height:30),
                      Image.asset('assets/zoo.png',
                      color: Colors.white),
                      const SizedBox(height:30),
                      SizedBox(
                        height: 45,
                        width: 350,
                          child: ElevatedButton(
                              style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0),
                              )
                            )
              ),
              child: const Text('Enter'),
              onPressed:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const ZooMainPage(title: 'Aalborg zoo');
                    })
                  ),
              ))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}