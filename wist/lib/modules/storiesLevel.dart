import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wist/modules/story_level.dart';
import 'package:wist/shard/cubit/cubit.dart';
import 'package:wist/shard/cubit/states.dart';

class StoriesLevel extends StatefulWidget {
  const StoriesLevel({super.key});

  @override
  State<StoriesLevel> createState() => _StoriesLevelState();
}

class _StoriesLevelState extends State<StoriesLevel> {
  final double itemSpacing = 5.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Center(
                  child: Wrap(spacing: 0, runSpacing: itemSpacing, children: [
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/aa.svg',
                      text: 'قصة حرف الألف',
                      page: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const StoryLevel()));
                      },
                      index: 0,
                    ),

                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/b.svg',
                      text: 'قصة حرف الباء',
                      page: () {},
                      index: 1,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/t.svg',
                      text: 'قصة حرف التاء',
                      page: () {},
                      index: 2,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/th.svg',
                      text: 'قصة حرف الثاء',
                      page: () {},
                      index: 3,
                    ),

                    AppCubit.get(context).story2(
                      pagname: (newbool) {
                        setState(() {
                        });
                      },
                      image: 'assets/aa.svg',
                      text: 'أ ب ت ث',
                      page: () {},
                      image2: 'assets/b.svg',
                      image3: 'assets/t.svg',
                      image4: 'assets/th.svg', index: 28,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/g.svg',
                      text: 'قصة حرف الجيم',
                      page: () {},
                      index: 4,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/h.svg',
                      text: 'قصة حرف الحاء',
                      page: () {},
                      index: 5,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/hh.svg',
                      text: 'قصة حرف الخاء',
                      page: () {},
                      index: 6,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/d.svg',
                      text: 'قصة حرف الدال',
                      page: () {},
                      index: 7,
                    ),
                    AppCubit.get(context).story2(
                      pagname: (newbool) {
                        setState(() {
                        });
                      },
                      image: 'assets/g.svg',
                      text: 'ج ح خ د',
                      page: () {},
                      image2: 'assets/h.svg', image3: 'assets/hh.svg', image4: 'assets/d.svg', index: 29,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/9.svg',
                      text: 'قصة حرف الذال',
                      page: () {},
                      index: 8,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/10.svg',
                      text: 'قصة حرف الراء',
                      page: () {},
                      index: 9,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/9.svg',
                      text: 'قصة حرف الزاي',
                      page: () {},
                      index: 10,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/c.svg',
                      text: 'قصة حرف السين',
                      page: () {},
                      index: 11,
                    ),
                    AppCubit.get(context).story2(
                      pagname: (newbool) {
                        setState(() {
                        });
                      },
                      image: 'assets/9.svg',
                      text: 'ذ ر ز س',
                      page: () {},
                      image2: 'assets/10.svg', image3: 'assets/9.svg', image4: 'assets/c.svg', index: 30,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/12.svg',
                      text: 'قصة حرف الشين',
                      page: () {},
                      index: 12,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/13.svg',
                      text: 'قصة حرف الصاد',
                      page: () {},
                      index: 13,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/14.svg',
                      text: 'قصة حرف الضاد',
                      page: () {},
                      index: 14,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/15.svg',
                      text: 'قصة حرف الطاء',
                      page: () {},
                      index: 15,
                    ),
                    AppCubit.get(context).story2(
                      pagname: (newbool) {
                        setState(() {
                        });
                      },
                      image: 'assets/12.svg',
                      text: 'ش ص ض ط',
                      page: () {},
                      image2: 'assets/13.svg', image3: 'assets/14.svg', image4: 'assets/15.svg', index: 31,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/16.svg',
                      text: 'قصة حرف الظاء',
                      page: () {},
                      index: 16,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/17.svg',
                      text: 'قصة حرف العين',
                      page: () {},
                      index: 17,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/18.svg',
                      text: 'قصة حرف الغين',
                      page: () {},
                      index: 18,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/19.svg',
                      text: 'قصة حرف الفاء',
                      page: () {},
                      index: 19,
                    ),
                    AppCubit.get(context).story2(
                      pagname: (newbool) {
                        setState(() {
                        });
                      },
                      image: 'assets/16.svg',
                      text: 'ظ ع غ ف',
                      page: () {},
                      image2: 'assets/17.svg', image3: 'assets/18.svg', image4: 'assets/19.svg', index: 32,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/20.svg',
                      text: 'قصة حرف القاف',
                      page: () {},
                      index: 20,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/21.svg',
                      text: 'قصة حرف الكاف',
                      page: () {},
                      index: 21,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/22.svg',
                      text: 'قصة حرف اللام',
                      page: () {},
                      index: 22,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/22.svg',
                      text: 'قصة حرف الميم',
                      page: () {},
                      index: 23,
                    ),
                    AppCubit.get(context).story2(
                      pagname: (newbool) {
                        setState(() {
                        });
                      },
                      image: 'assets/20.svg',
                      text: 'ق ك ل م',
                      page: () {},
                      image2: 'assets/21.svg', image3: 'assets/22.svg', image4: 'assets/22.svg', index: 33,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/24.svg',
                      text: 'قصة حرف النون',
                      page: () {},
                      index: 24,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/25.svg',
                      text: 'قصة حرف الهاء',
                      page: () {},
                      index: 25,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/26.svg',
                      text: 'قصة حرف الواو',
                      page: () {},
                      index: 26,
                    ),
                    AppCubit.get(context).storyyy(
                      pagname: (newBool) {
                        setState(() {});
                      },
                      image: 'assets/27.svg',
                      text: 'قصة حرف الياء',
                      page: () {},
                      index: 27,
                    ),
                    AppCubit.get(context).story2(
                      pagname: (newbool) {
                        setState(() {
                        });
                      },
                      image: 'assets/24.svg',
                      text: 'ن ه و ي',
                      page: () {},
                      image2: 'assets/25.svg', image3: 'assets/26.svg', image4: 'assets/27.svg', index: 34,
                    ),

                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
