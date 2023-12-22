import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/chart.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../constants.dart';
import 'components/ChartHist.dart';
import 'components/header.dart';

import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiles(),
                      SizedBox(height: defaultPadding),
                      RecentFiles(),
                      ChartHist(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StorageDetails(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        child: const ModelViewer(
//                          backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                        backgroundColor: Colors.transparent,
                          src: 'https://dashboard.twintivo.com/assets/images/wh1.glb',
                          alt: 'A Twintivo 3D Viewer',
                          ar: true,
                          autoRotate: true,
                          iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                          disableZoom: false,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
