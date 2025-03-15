class PayerState{}
class InstialState extends PayerState{}
class LoadingState extends PayerState{}
class DoneState extends PayerState{}
class ErrorState extends PayerState{
  String error;

  ErrorState(
  {
    required this.error
}
      );
}