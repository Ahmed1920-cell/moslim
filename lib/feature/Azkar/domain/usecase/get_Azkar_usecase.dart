

import '../entity/AzkarEntity.dart';
import '../repositry/AzkarRepo.dart';

class GetAzkarUsecase{
  Azkarrepo azkarrepo;
  GetAzkarUsecase(this.azkarrepo);
  Future<AzkarEntity> excute()async{
    return await azkarrepo.get();
  }
}