class AzkarState{}
class InstialState extends AzkarState{}
class Load extends AzkarState{}
class Done extends AzkarState{}
class Decrease extends AzkarState{}
class Error extends AzkarState{
  String error;

  Error(
  {
    required this.error
}
      );
}