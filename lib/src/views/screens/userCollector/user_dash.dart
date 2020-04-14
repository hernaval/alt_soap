import 'package:alt_soap/src/utils/utils.dart';
import 'package:alt_soap/src/views/widgets/customDrawer.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Nav Drawer"),
        centerTitle: true,
        backgroundColor: Loko.somaryManga,
      ),
    );
  }
}