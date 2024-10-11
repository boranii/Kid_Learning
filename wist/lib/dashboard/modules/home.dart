import 'package:flutter/material.dart';
import 'package:wist/dashboard/shared/components.dart';

const defaultPadding = 20.0;

class DashHome extends StatelessWidget {
  const DashHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: SideMenuPanel(),
            ),
            Expanded(
              flex: 7,
              child: DashboardMain(),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
