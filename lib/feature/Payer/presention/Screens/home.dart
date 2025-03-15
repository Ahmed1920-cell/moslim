import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../../../Azkar/presention/widgets/loading.dart';
import '../../domain/entity/PayerEntity.dart';
import '../Bloc/WeatherBloc.dart';
import '../Bloc/WeatherState.dart';
import '../widgets/Error.dart';
import '../widgets/body.dart';


class home_screen extends StatefulWidget {
  home_screen({super.key, this.user = ""});

  String user;

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  late PayerEntity payerEntity;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PayerCubit>(context).getpayer();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("مواقيت الصلاة"),
              centerTitle: true,
            ),
        backgroundColor: Colors.grey.shade300,
        body:  BlocBuilder<PayerCubit, PayerState>(
                builder: (context, state) {
              if (state is ErrorState) {
                return Error_screen(Error: state.error);
              } else if (state is DoneState) {
                payerEntity = BlocProvider.of<PayerCubit>(context).payer!;
                return body_screen(
                  payer: payerEntity,
                );
              } else {
                return loading();
              }
            })
      
        ),
      ),
    );
  }
}
