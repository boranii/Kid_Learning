
import 'package:flutter/material.dart';
import 'package:wist/dashboard/shared/components.dart';

const defaultPadding = 20.0;

class DashHome extends StatelessWidget {
  const DashHome({super.key});

  @override
  Widget build(BuildContext context) {

    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer: !isDesktop? const SizedBox(
        width:250,
        child:SideMenuPanel(),
      ):null,
      endDrawer: Responsive.isMobile(context)? SizedBox(
        width:MediaQuery.of(context).size.width * 0.8,
        child: const SummaryPanel(),
      ):null,
      body: SafeArea(
        child: Row(
          children: [
            if(isDesktop)
                const Expanded(
              flex: 2,
              child: SideMenuPanel(),
            ),
            const Expanded(
              flex: 7,
              child: DashboardMain(),
            ),
            if(isDesktop)
            const Expanded(
              flex: 3,
              child: SummaryPanel(),
            ),
          ],
        ),
      ),
    );
  }
}
