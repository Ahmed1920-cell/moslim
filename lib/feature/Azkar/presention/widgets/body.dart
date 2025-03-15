import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entity/AzkarEntity.dart';
import '../Bloc/AzkarBloc.dart';
import '../Bloc/AzkarState.dart';


class body_screen extends StatelessWidget {
  body_screen({super.key, required this.azkar,required this.azkarType});

  AzkarEntity azkar;
final azkarType;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AzkarCubit>(context);
    return BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              title: Text(
                azkarType == 0 ? 'أذكار الصباح' : 'أذكار المساء',
                style: TextStyle(
                  color:Theme.of(context).appBarTheme.foregroundColor,
                ),
              ),
            ),
            body: Center(

              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 30.0),
                  itemBuilder: (BuildContext context, int index) {
                    // print(cubit.azkarThwabAmData);
                    if (azkarType == 0) {
                      return azkarAmItem(
                          context,
                          index,
                          azkar.azkar_am[index],
                          azkar.azkarThwabAmData[index],
                          cubit.azkarCountAm[index],
                          azkarType);
                    } else if (azkarType == 1) {
                      return azkarAmItem(
                          context,
                          index,
                          azkar.azkar_pm[index],
                          azkar.azkarThwabpmData[index],
                          cubit.azkarCountpm[index],
                          azkarType);
                    } else {
                      return azkarAmItem(context, index, 'not found',
                          'not found', 0, azkarType);
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: azkarType == 0
                      ? azkar.azkar_am.length
                      : azkar.azkar_pm.length),
            ),
          );
        });
  }
  Widget azkarAmItem(BuildContext context, index, text, thwabText,  count, azkarType) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    final cubit = BlocProvider.of<AzkarCubit>(context);
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: screenWidth - 40,
            // height: 322,
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 20.0,
              bottom: 20.0,  // Adjust margin if circle is outside
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary, // primary
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  blurRadius: 10.0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary, // onPrimary
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    thwabText ?? '',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: -18,
            // Adjust this value to control how much the circle goes out of the box
            child: GestureDetector(
              onTap: (){
                cubit.decrement(count, index,azkarType);
              },
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline, // White border color
                    width: 3.0, // Border width
                  ),
                ),
                child: Center(
                  child: Text(
                    '$count',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onTertiary,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





