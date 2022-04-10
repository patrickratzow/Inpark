import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    Key? key,
    required this.animal,
  }) : super(key: key);

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Hero(
                tag: "animal-${animal.id}",
                child: CachedNetworkImage(
                  imageUrl: animal.image.previewUrl,
                  colorBlendMode: BlendMode.darken,
                  placeholder: (context, url) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  //border corner radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        animal.name.displayName.trim(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        animal.name.latinName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      textColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
                      title: Text(
                        animal.category,
                        style: TextStyle(
                            fontSize: 8,
                            background: Paint()
                              ..color = Colors.greenAccent
                              ..strokeWidth = 10
                              ..strokeJoin = StrokeJoin.round
                              ..strokeCap = StrokeCap.round
                              ..style = PaintingStyle.stroke,
                            color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
