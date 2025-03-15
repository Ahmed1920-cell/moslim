

import '../../../../core/network/Dio.dart';
import '../DTO/PayerModel.dart';

abstract class BasePayerDataRemote{
  Future get();

}
class PayerDataRemote extends BasePayerDataRemote{
  PayerDio payerDio;
  PayerDataRemote(this.payerDio);
  @override

  @override
  Future get() async{
    var response=await payerDio.getpayer();
    PayerModel payer=PayerModel.fromJson(response);
    return payer;
  }

}