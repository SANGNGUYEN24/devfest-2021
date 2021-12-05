import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:inherited_widget/state_manager/app_state.dart';
import 'package:inherited_widget/view/home/home.dart';

void main() {
  runApp(AppStateWidget(
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store',
      home: MyStorePage(),
    ),
  ));
}
