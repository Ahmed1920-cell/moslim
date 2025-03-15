import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../domain/entity/PayerEntity.dart';
import '../widgets/easy_date.dart';
import 'Row_Container.dart';

class body_screen extends StatelessWidget {
  body_screen({super.key, required this.payer});

  PayerEntity payer;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 550 / 776,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //icon
                Center(
                    child:
                    SvgPicture.asset(
                      "lib/core/assets/images/mosque.svg",
                      //colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                      semanticsLabel: 'Red dash paths',
                      height: MediaQuery.sizeOf(context).height * 250 / 776,
                      width: MediaQuery.sizeOf(context).width * 250 / 360,
                    )),
            /*Image.network(
                  "https:${weather.hour[0].condition.icon}",
                  height: MediaQuery.sizeOf(context).height * 250 / 776,
                  width: MediaQuery.sizeOf(context).width * 250 / 360,
                  fit: BoxFit.fill,
                )),*/

                RowContainer(text: "الفجر", time: payer.data.timings.fajr!,activeColor: true,),
                RowContainer(text: "الظهر", time: payer.data.timings.dhuhr!),
                RowContainer(text: "العصر", time: payer.data.timings.asr!,activeColor: true,),
                RowContainer(text: "المغرب", time: payer.data.timings.maghrib!),
                RowContainer(text: "العشاء", time: payer.data.timings.isha!,activeColor: true,),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 20 / 776,
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 110 / 776,
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                color: Color(0xFFD9C3B6), borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: EasyDate(
                          index: index,
                          date_weather: payer.data.date.gregorian.date,
                        ),
                      ),
                    ],
                  );
                }),
          ),
                  ],
      ),
    );
  }
}
