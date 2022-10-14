import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection_ext/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_use/flutter_use.dart';
import 'package:provider/provider.dart';
import 'package:tenants/common/color.dart';
import 'package:tenants/services/location_service.dart';
import 'package:tenants/ui/location/confirm_location_modal.dart';
import 'package:tenants/ui/park/fetching_parks_screen.dart';
import 'package:tenants/ui/park/park_list.dart';
import '../../models/park_model.dart';

class ParkPage extends HookWidget {
  const ParkPage({super.key});

  @override
  Widget build(BuildContext context) {
    var tenant = Provider.of<ParkModel>(context);
    var locationService = LocationService();

    useEffectOnce(() {
      tenant.fetchParks();
      return null;
    });

    /**
     * When getting to park page, ask for users for location permission
     * Search for parks near the user
     * Show result
     */
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vælg park"),
      ),
      body: _showParks(tenant),
    );
  }

  ListView _showParks(ParkModel tenant) {
    return ListView(
      children: tenant.loading
          ? [
              const Padding(
                padding: EdgeInsets.only(top: 227, left: 90, right: 90),
                child: FetchParksScreen(),
              ),
              const ConfirmLocationModal()
            ]
          : [
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nearby",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              ParkList(parks: tenant.parks),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Others",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              TestParkList(parks: tenant.testParks())
            ],
    );
  }
}

Widget _buildNearbyParks() {
  return Container();
}

Widget _buildOtherParks() {
  return Container();
}

Widget _distanceToPark() {
  return Container();
}

class TestParkList extends HookWidget {
  final List<TestPark> parks;

  const TestParkList({
    super.key,
    required this.parks,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: parks
          .mapIndexed(
            (idx, testPark) => TestParkCard(park: testPark, id: idx),
          )
          .toList(),
    );
  }
}

class TestParkCard extends HookWidget {
  final TestPark park;
  final int id;
  final double height = 153;
  final double width = 343;

  const TestParkCard({
    super.key,
    required this.park,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 18,
        bottom: 18,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColor.green.lightest,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        height: height + 55,
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: park.imageUrl,
                  imageBuilder: ((context, imageProvider) => Container(
                        height: height,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(9, 6, 9, 6),
                  child: Text("${park.location} KM"),
                )
              ],
            ),
            Text(park.name),
          ],
        ),
      ),
    );
  }
}
