import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/app_router/app_router.dart';
import '../../../Payer/presention/widgets/loading.dart';
import '../../domain/entity/AzkarEntity.dart';
import '../Bloc/AzkarBloc.dart';
import '../Bloc/AzkarState.dart';
import '../widgets/Error.dart';
import '../widgets/body.dart';


class home extends StatefulWidget {
  home({super.key});


  @override
  State<home> createState() => _home_screenState();
}

class _home_screenState extends State<home> {
  late AzkarEntity azkarEntity;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AzkarCubit>(context).getAzkar();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(""),
              centerTitle: true,
            ),
        backgroundColor: Colors.grey.shade300,
        body:  BlocBuilder<AzkarCubit, AzkarState>(
                builder: (context, state) {
              if (state is Error) {
                return Error_screen(Error: state.error);
              } else if (state is Load) {
                return loading();
              } else {
                azkarEntity = BlocProvider.of<AzkarCubit>(context).Azkar!;
                print(azkarEntity.azkar_am);
                return Center(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return azkarItem(context, MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height,index,azkarEntity);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: 2),
                );
              }
            })
      
        ),
      ),
    );
  }
}

Widget azkarItem(context, screenWidth, screenHeight, index,data) {
  return GestureDetector(
    onTap: () {
      Route_Page.push(context: context, page: body_screen(azkar:data ,azkarType: index,));
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AzkarAmOrPm(azkarType: index)),
      );*/
    },
    child: Container(
      width: screenWidth * 1,
      height: screenHeight * 0.25,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          index == 0 ? 'lib/core/assets/images/azkar_am.jpg' : 'lib/core/assets/images/azkar_pm.jpg',
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
