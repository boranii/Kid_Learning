import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wist/my__icons_icons.dart';
import 'package:wist/shared/components/components.dart';
import '../../modules/test/sketch.dart';
import '../../shard/components/components.dart';
import '../../shard/cubit/cubit.dart';
import '../../shard/cubit/states.dart';
import '../../shard/styles/color.dart';
import 'drawing.dart';

class DrawingPage extends HookWidget {
  const DrawingPage({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<Sketch?> currentSketch = useState(null);
    ValueNotifier<List<Sketch>> allSketches = useState([]);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorMain.colorOrange,
                        radius: 30,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              My_Icons.buttonarrowleft,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: ColorMain.colorOrange,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              My_Icons.buttonarrowright,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage('assets/Letters.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  height: 450,
                  // width: 50,
                  child: DrawingApp(
                    allSketches: allSketches,
                    currentSketch: currentSketch,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/MapButton.svg', height: 70,),
                    onBoardingButton(context, () {
                      if(AppCubit.get(context).level <= 6){
                      AppCubit.get(context).level= AppCubit.get(context).level + 1;
                      }
                      if(AppCubit.get(context).fill > 0){
                        if(AppCubit.get(context).fill == 20)
                          {
                            AppCubit.get(context).fill= AppCubit.get(context).fill - 20;
                          }
                        else{
                        AppCubit.get(context).fill= AppCubit.get(context).fill - 30;
                        }
                      }
                      if (kDebugMode){
                        print(AppCubit.get(context).level);
                        print(AppCubit.get(context).fill);
                      }
                      Navigator.of(context).pushReplacementNamed('Map');
                    }, 'التالي'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
