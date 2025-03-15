import 'package:bloc/bloc.dart';

import '../../../../core/assets/componant.dart';
import '../../domain/entity/AzkarEntity.dart';
import '../../domain/usecase/get_Azkar_usecase.dart';
import 'AzkarState.dart';
class AzkarCubit extends Cubit<AzkarState>{
  GetAzkarUsecase getAzkarUsecase;
  AzkarEntity? Azkar;
  List azkarCountAm=azkarCountAmNum;
  List azkarCountpm=azkarCountPmNum;
  AzkarCubit(this.getAzkarUsecase):super(InstialState());

  getAzkar()async{
    try{
  emit(Load());
  Azkar=await getAzkarUsecase.excute();
  emit(Done());}
        catch(e){
      emit(Error(error: e.toString()));
        }

}
  void decrement(currentCount, index, azkarType) {
    if (currentCount != 0 && azkarType == 0) {
      currentCount--;
      azkarCountAmNum[index] = currentCount;
      emit(Decrease());
    } else if (currentCount != 0 && azkarType == 1) {
      currentCount--;
      azkarCountPmNum[index] = currentCount;
      emit(Decrease());
    }
  }

}