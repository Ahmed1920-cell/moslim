import 'package:bloc/bloc.dart';
import '../../../../core/network/location.dart';
import '../../domain/entity/PayerEntity.dart';
import '../../domain/usecase/get_Payer_usecase.dart';
import 'WeatherState.dart';


class PayerCubit extends Cubit<PayerState>{
  GetPayerUsecase getPayerUsecase;
  PayerEntity? payer;
  PayerCubit(this.getPayerUsecase):super(InstialState());

  getpayer()async{
    try{
  emit(LoadingState());
  payer=await getPayerUsecase.excute();
  emit(DoneState());}
        catch(e){
      emit(ErrorState(error: e.toString()));
        }

}

}