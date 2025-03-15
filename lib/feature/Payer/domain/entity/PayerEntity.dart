class PayerEntity {
  Data data;

  PayerEntity({
    required this.data,
  });

  factory PayerEntity.fromJson(Map<String, dynamic> json) => PayerEntity(
    data: Data.fromJson(json["data"]),
  );

}

class Data {
  Timings timings;
  Date date;

  Data({
    required this.timings,
    required this.date,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    timings: Timings.fromJson(json["timings"]),
    date: Date.fromJson(json["date"]),
  );

}

class Date {
  Hijri hijri;
  Gregorian gregorian;

  Date({
    required this.hijri,
    required this.gregorian,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    hijri: Hijri.fromJson(json["hijri"]),
    gregorian: Gregorian.fromJson(json["gregorian"]),
  );

}

class Gregorian {
  String? date;
  String? format;
  String? day;
  String? year;

  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.year,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
    date: json["date"],
    format: json["format"],
    day: json["day"],
    year: json["year"],
  );


}






class Hijri {
  String? date;
  String? format;
  String? day;
  String? method;

  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.method,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) => Hijri(
    date: json["date"],
    format: json["format"],
    day: json["day"],
    method: json["method"],
  );


}

class Timings {
  String? fajr;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;

  Timings({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
    fajr: json["Fajr"],
    dhuhr: json["Dhuhr"],
    asr: json["Asr"],
    maghrib: json["Maghrib"],
    isha: json["Isha"],
  );

}
