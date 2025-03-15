import 'package:flutter/material.dart';

import '../core/app_router/app_router.dart';
import 'Azkar/presention/Screens/home.dart';
import 'Payer/presention/Screens/home.dart';
import 'Qbla/home_qbla.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              // backgroundColor: Colors.brown,
              title: const Text(
                'الصفحة الرئيسية',
                style: TextStyle(
                  // color: Colors.white,
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Route_Page.push(context: context, page: home());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: screenWidth * 1,
                      height: screenHeight * 0.1,
                      margin: const EdgeInsets.all(10),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          'أذكار الصباح و المساء',
                          textDirection: TextDirection.rtl,

                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Route_Page.push(context: context, page: home_screen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: screenWidth * 1,
                      height: screenHeight * 0.1,
                      margin: const EdgeInsets.all(10),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          'مواقيت الصلاة',
                          textDirection: TextDirection.rtl,

                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Route_Page.push(context: context, page: HomeQibla());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: screenWidth * 1,
                      height: screenHeight * 0.1,
                      margin: const EdgeInsets.all(10),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          'اتجاه القبلة',
                          textDirection: TextDirection.rtl,

                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

  }
}
