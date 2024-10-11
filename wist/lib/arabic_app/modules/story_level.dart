// import 'package:flutter/foundation.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../my__icons_icons.dart';
// import '../shared/components/style/colors.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/story.dart';
import '../shard/components/components.dart';
import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';

class StoryLevel extends StatefulWidget {
  const StoryLevel({super.key});

  @override
  State<StoryLevel> createState() => _StoryLevelState();
}

class _StoryLevelState extends State<StoryLevel> {
  int selectedIndex = -1;
  PageController storyController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: FutureBuilder(
              future: AppCubit.get(context).getStory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    StoryModel? story = snapshot.data?[0];
                    List<Map<String, dynamic>?> list = [];
                    list.add(story!.firstPage);
                    list.add(story.secondPage);
                    list.add(story.thirdPage);
                    list.add(story.fourthPage);
                    list.add(story.fifthPage);
                    // var soundLevel = level?.firstLevel?['soundLevel'];
                    // int selectedIndex = soundLevel['repeat']??3;
                    return PageView.builder(
                      controller: storyController,
                      itemBuilder: (context, index) => storyTemplate(
                        context,
                        list,
                        index,
                        selectedIndex,
                        storyController,
                      ),
                      itemCount: list.length,
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        " ${snapshot.error.toString()} =======",
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(
                        "Error",
                      ),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
// PageView.builder(
// controller: storyController,
// itemBuilder: (context, index) => storyTemplate(
// context,
// stories[index],
// ),
// itemCount: stories.length,
// ),
