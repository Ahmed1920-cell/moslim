

import '../../../../core/data/AzkarData.dart';
import '../DTO/AzkarModel.dart';

abstract class BaseAzkarDataRemote{
  Future get();

}
class Azkardataremote extends BaseAzkarDataRemote{
  AzkarData azkarData;
  Azkardataremote(this.azkarData);
  @override

  @override
  Future get() async{
     AzkarModel azkarModel=AzkarModel(azkar_am: await azkarData.getDataAm(), azkar_pm: await azkarData.getDataPm(), azkarThwabAmData: await azkarData.getDataThwabAm(), azkarThwabpmData: await azkarData.getDataThwabPm());
    return azkarModel;
  }

}