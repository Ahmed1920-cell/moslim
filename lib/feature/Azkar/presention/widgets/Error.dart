import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/AzkarBloc.dart';

class Error_screen extends StatelessWidget {
  Error_screen({super.key, required this.Error});

  String Error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Error),
          IconButton(
              onPressed: () {
                BlocProvider.of<AzkarCubit>(context).getAzkar();
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
