import 'package:flutter/material.dart';
import 'package:wist/dashboard/models/cardModel.dart';
import 'package:wist/dashboard/models/menu_model.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: const Column(
        children: [
          SizedBox(
            height: 18,
          ),
          HeaderWidget(),
          SizedBox(
            height: 18,
          ),
          const ActivityCard(),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

