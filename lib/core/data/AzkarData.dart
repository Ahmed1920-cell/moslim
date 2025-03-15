import 'dart:collection';

import 'package:flutter/services.dart';

class AzkarData{
     Future getDataAm() async {
    String response;
    List azkarAmData=[];
    for (int numOfFile = 0; numOfFile < 31; numOfFile++) {
      response = await rootBundle.loadString(
          'lib/core/assets/texts/azkar_am/azkar_am_${numOfFile + 1}.txt');
      azkarAmData.add(response);

    }
    print("hello");
    return azkarAmData;
  }
     Future getDataThwabAm() async {
    String response;
    HashMap<int, String> azkarThwabAmData=HashMap<int, String>();
    for (int numOfFile = 0; numOfFile < 31; numOfFile++) {
try{
  response = await rootBundle.loadString(
      'lib/core/assets/texts/azkar_am/azkar_thwab_am_${numOfFile + 1}.txt');
  azkarThwabAmData.addAll({numOfFile: response});
}
catch(e){

}

    }
    print("hello");
    return azkarThwabAmData;
  }

   Future getDataPm() async {
    String response;
    List azkarPmData=[];
    for (int numOfFile = 0; numOfFile < 30; numOfFile++) {
      print("$numOfFile");
      response = await rootBundle.loadString(
          'lib/core/assets/texts/azkar_pm/azkar_pm_${numOfFile + 1}.txt');
      azkarPmData.add(response);

    }
    return azkarPmData;
  }

  Future getDataThwabPm() async {
    String response;
    HashMap<int, String> azkarThwabPmData=HashMap<int, String>();
    print("hello");
    for (int numOfFile = 0; numOfFile < 30; numOfFile++) {
      print("$numOfFile");
try{
  response = await rootBundle.loadString(
      'lib/core/assets/texts/azkar_pm/azkar_thwab_pm_${numOfFile + 1}.txt');
  azkarThwabPmData.addAll({numOfFile: response});
}catch(e){

}

    }
    print("hello");
    return azkarThwabPmData;
  }


}