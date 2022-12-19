import 'package:esgi_td/core/activity.dart';
import 'package:esgi_td/footer.dart';
import 'package:esgi_td/header.dart';
import 'package:flutter/material.dart';

import 'core/helpers.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tp noté Flutter',
        theme: kTheme,
        home: Page(
          activities: [
            'cinema',
            'petanque',
            'fitness',
            'League Of Legends',
            'basket',
            'shopping',
            'programmation'
          ].map((title) => Activity(title: title)).toList(),
        ));
  }
}


class Page extends StatefulWidget {
  const Page({Key? key, required this.activities}) : super(key: key);

  final List<Activity> activities;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  late List<Activity> activities;

  @override
  void initState() {
    super.initState();
    activities = widget.activities;
  }

  void onUpdateActivities(List<Activity> activities) {
    setState(() {
      this.activities = activities;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Flexible(flex: 2, fit: FlexFit.tight, child: Header(activities: activities)),
              Flexible(
                  fit: FlexFit.tight,
                  child: Footer(
                    activities: activities,
                    onActivitiesChange: onUpdateActivities,
                  )),
            ],
          )),
    );
  }
}












