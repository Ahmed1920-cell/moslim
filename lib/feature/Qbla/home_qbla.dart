import 'dart:math';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'compass.dart';

class HomeQibla extends StatefulWidget {
   HomeQibla({super.key});

  @override
  State<HomeQibla> createState() => _HomeQiblaState();
}

class _HomeQiblaState extends State<HomeQibla> {
  Future<Position>? getPosition;

  @override
  void initState() {
    super.initState();
    getPosition = _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Qibla Finder App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<Position>(
          future: getPosition,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Position positionResult = snapshot.data!;
              Coordinates coordinates = Coordinates(
                positionResult.latitude,
                positionResult.longitude,
              );
              double qiblaDirection = Qibla.qibla(
                coordinates,
              );
              return StreamBuilder(
                stream: FlutterCompass.events,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error reading heading: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }

                  double? direction = snapshot.data!.heading;

                  // if direction is null,
                  // then device does not support this sensor

                  // show error message
                  if (direction == null) {
                    return const Center(
                      child: Text("Device does not have sensors !"),
                    );
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              size: size,
                              painter: CompassCustomPainter(
                                angle: direction,
                              ),
                            ),
                            Transform.rotate(
                              angle: -2 * pi * (direction / 360),
                              child: Transform(
                                alignment: FractionalOffset.center,
                                transform: Matrix4.rotationZ(
                                    qiblaDirection * pi / 180),
                                origin: Offset.zero,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    'lib/core/assets/images/img.png',
                                    width: 112,
                                    // height: 32,
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.transparent,
                              radius: 140,
                              child: Transform.rotate(
                                angle: -2 * pi * (direction / 360),
                                child: Transform(
                                  alignment: FractionalOffset.center,
                                  transform: Matrix4.rotationZ(
                                      qiblaDirection * pi / 180),
                                  origin: Offset.zero,
                                  child: const Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Icons.expand_less_outlined,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 0.45),
                              child: Text(
                                showHeading(direction, qiblaDirection),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

String showHeading(double direction, double qiblaDirection) {
  int result=direction.toInt()-qiblaDirection.toInt();
  
  if(result<0){
    result=result+360;
  }

  return qiblaDirection.toInt() != direction.toInt()
      ? 'ارجع ${result} ° لكي تصل الي اتجاه مكة '
      : "انت الان فى اتجاه مكة ";
}