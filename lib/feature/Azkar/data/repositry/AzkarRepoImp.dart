import '../../domain/repositry/AzkarRepo.dart';
import '../DataSource/AzkarDataRemote.dart';

class AzkarRepoImp extends Azkarrepo{
  BaseAzkarDataRemote baseAzkarDataRemote;
  AzkarRepoImp(this.baseAzkarDataRemote);
  @override
  Future get() async{
    return await baseAzkarDataRemote.get();
  }
}