import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time_app/screens/home/authenticate/authenticate.dart';
import 'package:world_time_app/screens/home/authenticate/home.dart';
import 'package:world_time_app/screens/home/authenticate/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
