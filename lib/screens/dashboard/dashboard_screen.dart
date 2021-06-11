import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/data_stream.dart';

import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';

import 'package:admin/screens/dashboard/components/resources.dart';
import 'components/actions.dart' as Actions;

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: defaultPadding,
              width: double.infinity,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Resources(),
                      SizedBox(width: double.infinity, height: defaultPadding),
                      Actions.Actions(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) DataStream(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 1,
                    child: DataStream(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
