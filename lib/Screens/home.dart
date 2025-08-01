import 'package:calculator/constants/color.dart';
import 'package:calculator/custom_widget/input_user.dart';
import 'package:calculator/custom_widget/numbers_of_grideView.dart';
import 'package:calculator/custom_widget/result.dart';
import 'package:calculator/custom_widget/switch_between_dark_light.dart';
import 'package:calculator/data/data.dart';
import 'package:calculator/logic/operations/Operations_cubit.dart';
import 'package:calculator/logic/themes/Themes_cubit.dart';
import 'package:calculator/logic/operations/Operations_State_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemesCubit>().state == ThemeMode.dark;
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final num = Data.getFlatValues(isDark);

    return Scaffold(
      backgroundColor:
           AppColors.background(isDark),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [

                SizedBox(height: screenHeight * 0.03),
        
                //button switch between dark and light mode
                Center(
                    child: SwitchBetweenDarkLight(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        isDark: isDark,
                )),
        
                SizedBox(height: screenHeight * 0.03),
        
                // user input
                BlocBuilder<OperationsCubit, InitalOperations>(
                  builder: (context, state) {
                    return InputUser(
                      input: state.input,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      isDark: isDark,
                    );
                  },
                ),
                SizedBox(height: screenHeight * 0.015),
        
                // result
                BlocBuilder<OperationsCubit, InitalOperations>(
                  builder: (context, state) {
                    return Result(
                      result: state.result,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      isDark: isDark,
                    );
                  },
                ),
                SizedBox(height: screenHeight * 0.06),
        
              // Numbers grid view(design buttons)
                Expanded(
                      child: NumbersOfGrideview(
                          num: num,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          isDark: isDark)),  
              ],
            ),
        
            
          ],
        ),
      ),
    );
  }
}
