import '../../domain/repositry/PayerRepo.dart';
import '../DataSource/PayerDataRemote.dart';

class PayerRepoImp extends PayerRepo{
  BasePayerDataRemote basePayerDataRemote;
  PayerRepoImp(this.basePayerDataRemote);
  @override
  Future get() async{
    return await basePayerDataRemote.get();
  }
}