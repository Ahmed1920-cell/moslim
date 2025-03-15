
import '../entity/PayerEntity.dart';
import '../repositry/PayerRepo.dart';

class GetPayerUsecase{
  PayerRepo payerRepo;
  GetPayerUsecase(this.payerRepo);
  Future<PayerEntity> excute()async{
    return await payerRepo.get();
  }
}