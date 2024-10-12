import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wist/dashboard/models/bar_graph_model.dart';
import 'package:wist/dashboard/models/cardModel.dart';
import 'package:wist/dashboard/models/menu_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wist/dashboard/models/schedule_model.dart';
import 'package:wist/dashboard/modules/home.dart';

import '../models/graph_model.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(iconData: Icons.home, title: 'Dashboard'),
    MenuModel(iconData: Icons.person, title: 'Profile'),
    MenuModel(iconData: Icons.run_circle, title: 'Exercise'),
    MenuModel(iconData: Icons.settings, title: 'Settings'),
    MenuModel(iconData: Icons.history, title: 'History'),
    MenuModel(iconData: Icons.logout, title: 'Sign Out'),
  ];
}

class ActivityCardData {
  final menu = const <CardModel>[
    CardModel(icon: Icons.home, title: 'Dashboard', value: '20'),
    CardModel(icon: Icons.home, title: 'Dashboard', value: '20'),
    CardModel(icon: Icons.home, title: 'Dashboard', value: '20'),
    CardModel(icon: Icons.home, title: 'Dashboard', value: '20'),
  ];
}

class SideMenuPanel extends StatefulWidget {
  const SideMenuPanel({super.key});

  @override
  State<SideMenuPanel> createState() => _SideMenuPanelState();
}

class _SideMenuPanelState extends State<SideMenuPanel> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    bool isSelected = selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              6.0,
            ),
          ),
          color: isSelected ? Colors.grey : Colors.transparent,
        ),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: Icon(
                data.menu[index].iconData,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.black : Colors.grey,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardMain extends StatelessWidget {
  const DashboardMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            const HeaderWidget(),
            const SizedBox(
              height: 18,
            ),
            const ActivityCard(),
            const SizedBox(
              height: 18,
            ),
            const LineChartCard(),
            const SizedBox(
              height: 18,
            ),
            const BarGraphCard(),
            const SizedBox(
              height: 18,
            ),
              if (Responsive.isTablet(context))
                const SummaryPanel(),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
                onTap: () {
                  log('pressed', name: 'SearchBar');
                  Scaffold.of(context).openDrawer();
                  log("${Scaffold.of(context).isDrawerOpen}",
                      name: 'Scaffold Drawer');
                },
                child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.menu,
                      color: Colors.grey,
                      size: 25,
                    ))),
          ),
        if(!Responsive.isMobile(context))
          Expanded(
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                  size: 21,
                )),
          ),
        ),
        if (Responsive.isMobile(context))
          Row(
            children: [

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
              InkWell(
                onTap: ()=>Scaffold.of(context).openEndDrawer(),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.person,color: Colors.grey,size: 25,),
                ),
              )
            ],
          ),
      ],
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    ActivityCardData data = ActivityCardData();
    return GridView.builder(
        physics: const ScrollPhysics(),
        itemCount: data.menu.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) => CustomCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    data.menu[index].icon,
                    color: Colors.white,
                    size: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 4,
                    ),
                    child: Text(
                      data.menu[index].value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    data.menu[index].title,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ));
  }
}

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;

  const CustomCard({super.key, required this.child, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.black,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: padding ??
            const EdgeInsets.all(
              12.0,
            ),
        child: child,
      ),
    );
  }
}

class LineData {
  final spots = const [
    FlSpot(1.68, 21.04),
    FlSpot(2.48, 41.34),
    FlSpot(5.68, 71.04),
    FlSpot(6.68, 88.04),
    FlSpot(8.68, 98.04),
    FlSpot(10.68, 99.04),
    FlSpot(14.68, 100.04),
    FlSpot(15.68, 106.04),
    FlSpot(16.68, 106.04),
    FlSpot(17.68, 106.04),
    FlSpot(57.68, 76.04),
    FlSpot(62.68, 58.04),
    FlSpot(80.68, 103.04),
  ];
  final leftTitle = const {
    0: '0',
    20: '2k',
    40: '4k',
    60: '6k',
    80: '8k',
    100: '10k',
  };
  final bottomTitle = {
    0: 'Jan',
    10: 'Feb',
    20: 'Mar',
    30: 'Apr',
    40: 'May',
    50: 'Jun',
    60: 'Jul',
    70: 'Aug',
    80: 'Sep',
    90: 'Oct',
    100: 'Nov',
    110: 'Dec',
  };
}

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    LineData data = LineData();
    return CustomCard(
        child: Column(
      children: [
        const Text(
          'Step OverView',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AspectRatio(
          aspectRatio: 16 / 6,
          child: LineChart(
            LineChartData(
              lineTouchData: const LineTouchData(
                handleBuiltInTouches: true,
              ),
              gridData: const FlGridData(
                show: false,
              ),
              titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return data.bottomTitle[value.toInt()] != null
                              ? SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: Text(
                                    data.bottomTitle[value.toInt()].toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[400],
                                    ),
                                  ))
                              : const SizedBox();
                        }),
                  ),
                  leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 40,
                          getTitlesWidget: (
                            double value,
                            TitleMeta meta,
                          ) {
                            return data.leftTitle[value.toInt()] != null
                                ? Text(
                                    data.leftTitle[value.toInt()].toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[400],
                                    ),
                                  )
                                : const SizedBox();
                          }))),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  color: Colors.grey,
                  barWidth: 2.5,
                  belowBarData: BarAreaData(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(.5),
                        Colors.transparent,
                      ],
                    ),
                    show: true,
                  ),
                  dotData: const FlDotData(show: false),
                  spots: data.spots,
                ),
              ],
              minX: 0,
              maxX: 120,
              minY: -5,
              maxY: 105,
            ),
          ),
        )
      ],
    ));
  }
}

class BarGraphData {
  final data = [
    const BarGraphModel(
      label: 'Activity Level',
      color: Colors.amber,
      graph: [
        GraphModel(x: 0, y: 8),
        GraphModel(x: 1, y: 10),
        GraphModel(x: 2, y: 7),
        GraphModel(x: 3, y: 4),
        GraphModel(x: 4, y: 4),
        GraphModel(x: 5, y: 6),
      ],
    ),
    const BarGraphModel(
      label: 'Nutrition Level',
      color: Colors.deepPurpleAccent,
      graph: [
        GraphModel(x: 0, y: 8),
        GraphModel(x: 1, y: 10),
        GraphModel(x: 2, y: 7),
        GraphModel(x: 3, y: 4),
        GraphModel(x: 4, y: 4),
        GraphModel(x: 5, y: 6),
      ],
    ),
    const BarGraphModel(
      label: 'Hydration Level',
      color: Colors.lightBlueAccent,
      graph: [
        GraphModel(x: 0, y: 8),
        GraphModel(x: 1, y: 10),
        GraphModel(x: 2, y: 7),
        GraphModel(x: 3, y: 4),
        GraphModel(x: 4, y: 4),
        GraphModel(x: 5, y: 6),
      ],
    ),
  ];
  final label = [
    "M",
    "T",
    'W',
    'T',
    'F',
    'S',
  ];
}

class BarGraphCard extends StatelessWidget {
  const BarGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    final barGraphData = BarGraphData();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 12.0,
        childAspectRatio: 5 / 4,
      ),
      itemCount: barGraphData.data.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) => CustomCard(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                barGraphData.data[index].label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                    barGroups: _chartGroups(
                      points: barGraphData.data[index].graph,
                      color: barGraphData.data[index].color,
                    ),
                    borderData: FlBorderData(
                      border: const Border(),
                    ),
                    gridData: const FlGridData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                  ),
                                  child: Text(
                                    barGraphData.label[value.toInt()],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ),
                                  ),
                                );
                              })),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups(
      {required List<GraphModel> points, required Color color}) {
    return points
        .map(
          (point) => BarChartGroupData(
            x: point.x.toInt(),
            barRods: [
              BarChartRodData(
                toY: point.y,
                width: 12,
                color: color.withOpacity(point.y.toInt() > 4 ? 1 : 0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(3.0),
                  topRight: Radius.circular(3.0),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}

class ChartData {
  final pieChartSectionData = [
    PieChartSectionData(
      color: Colors.red,
      value: 25,
      showTitle: false,
      radius: 25,
    ),
    PieChartSectionData(
      color: Colors.blue,
      value: 20,
      showTitle: false,
      radius: 22,
    ),
    PieChartSectionData(
      color: Colors.deepPurpleAccent,
      value: 10,
      showTitle: false,
      radius: 19,
    ),
    PieChartSectionData(
      color: Colors.amber,
      value: 15,
      showTitle: false,
      radius: 16,
    ),
    PieChartSectionData(
      color: Colors.grey,
      value: 25,
      showTitle: false,
      radius: 13,
    ),
  ];
}

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ChartData();
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(PieChartData(
            sectionsSpace: 0,
            centerSpaceRadius: 70,
            startDegreeOffset: -90,
            sections: data.pieChartSectionData,
          )),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  '70%',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w600,
                        height: .5,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'of 100%',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SummaryDetails extends StatelessWidget {
  const SummaryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.grey.shade400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildDetails('Cal', "305"),
          buildDetails('Steps', "10983"),
          buildDetails('Distance', "7km"),
          buildDetails('Sleep', "7hr"),
        ],
      ),
    );
  }

  Widget buildDetails(
    String key,
    String value,
  ) {
    return Column(
      children: [
        Text(
          key,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class ScheduleTasksData {
  final scheduled = const [
    ScheduleModel(title: 'Hatha Yoga', date: 'Today,9Aam - 10AM'),
    ScheduleModel(title: 'Hatha Yoga', date: 'Today,9Aam - 10AM'),
    ScheduleModel(title: 'Hatha Yoga', date: 'Today,9Aam - 10AM'),
  ];
}

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ScheduleTasksData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Schedule",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 12,
        ),
        for (var index = 0; index < data.scheduled.length; index++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: CustomCard(
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.scheduled[index].title,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            data.scheduled[index].date,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.more,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}

class SummaryPanel extends StatelessWidget {
  const SummaryPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color:Theme.of(context).scaffoldBackgroundColor,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Chart(),
            Text(
              'Summary',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SummaryDetails(),
            SizedBox(
              height: 16,
            ),
            Schedule(),
          ],
        ),
      ),
    );
  }
}

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}
