import "package:flutter/material.dart";
import 'package:flutter_app/routes.dart';
import "package:flutter_app/screens/zoomain.dart";

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Enter Zoo"),
        onPressed: () {
          showModalBottomSheet<Widget>(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const Text(
                        "Aalborg Zoo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: "Inter",
                        ),
                      ),
                      const Text(
                        "Lorem ipsum dolor sit amet, "
                        "consectetur adipiscing elit. "
                        "Morbi convallis justo at mi ultricies sollicitudin.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Inter",
                        ),
                      ),
                      Image.asset(
                        "assets/zoo.png",
                        color: Colors.white,
                        scale: 0.6,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0),
                            ),
                          ),
                        ),
                        child: const Text("Gå til park"),
                        onPressed: () =>
                            Routes.goToRoute(context, "zooMainView"),
                      ),
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
