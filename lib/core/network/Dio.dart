import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';


import '../db/sql.dart';
import 'location.dart';

class PayerDio{
Dio dio;
location loc;
Sql db;
PayerDio(this.dio,this.loc,this.db);
Future getpayer() async {
  try {
    List data = [];
    var date = DateFormat('dd-MM-yyyy')
        .format(Jiffy.parse(DateTime.now().toString()).subtract(days: 1).dateTime);
    List<Map> yet_data = await db.find("almoslim", "DATE = ?", [date]);
    if(yet_data.isNotEmpty){
      await db.delete("almoslim", "DATE = ?", [date]);
         date = DateFormat('dd-MM-yyyy')
            .format(Jiffy.parse(DateTime.now().toString()).add(days: 6).dateTime);
        var url =
            "https://api.aladhan.com/v1/timingsByAddress/$date?address=${await loc.getCurrentLocation()}";
        print(url);

        var response = await dio.get(url);
        var json = response.data["data"]["timings"];

        await db.insert("almoslim", {
          "Fajr": json["Fajr"],
          "Dhuhr": json["Dhuhr"],
          "Asr": json["Asr"],
          "Maghrib": json["Maghrib"],
          "Isha": json["Isha"],
          "DATE": date,
          "hijri": response.data["data"]["date"]["hijri"]["date"],
        });

    }
    String today = DateFormat("dd-MM-yyyy").format(DateTime.now());
    List<Map> DB_data = await db.find("almoslim", "DATE = ?", [today]);
    data.addAll(DB_data);
    if (data.isNotEmpty) {
      var body = {
        "data": {
          "timings": {
            "Fajr": data[0]["Fajr"],
            "Dhuhr": data[0]["Dhuhr"],
            "Asr": data[0]["Asr"],
            "Maghrib": data[0]["Maghrib"],
            "Isha": data[0]["Isha"],
          },
          "date": {
            "hijri": {
              "date": data[0]["hijri"],
            },
            "gregorian": {
              "date": data[0]["DATE"],
            }
          }
        }
      };
      return body; // ✅ Yielding stored data
    } else {
      await db.empty("almoslim");

      for (int i = 0; i < 30; i++) {
        var date = DateFormat('dd-MM-yyyy')
            .format(Jiffy.parse(DateTime.now().toString()).add(days: i).dateTime);
        var url =
            "https://api.aladhan.com/v1/timingsByAddress/$date?address=${await loc.getCurrentLocation()}";
        print(url);

        var response = await dio.get(url);
        var json = response.data["data"]["timings"];

        await db.insert("almoslim", {
          "Fajr": json["Fajr"],
          "Dhuhr": json["Dhuhr"],
          "Asr": json["Asr"],
          "Maghrib": json["Maghrib"],
          "Isha": json["Isha"],
          "DATE": date,
          "hijri": response.data["data"]["date"]["hijri"]["date"],
        });
      }
      var date = DateFormat('dd-MM-yyyy')
          .format(Jiffy.parse(DateTime.now().toString()).dateTime);
      var url =
          "https://api.aladhan.com/v1/timingsByAddress/$date?address=${await loc.getCurrentLocation()}";
      print(url);

      var response = await dio.get(url);
      print("done");

      return response.data;
    }
  } catch (e) {
    throw "بالرجاء فتح النت لتحميل مواقيت الصلاة الجديدة";
  }
}
}