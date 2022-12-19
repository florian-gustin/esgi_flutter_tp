

import 'package:flutter/material.dart';

import 'choice_item.dart';
import 'core/activity.dart';
import 'core/helpers.dart';

class Footer extends StatelessWidget {
  const Footer(
      {Key? key, required this.activities, required this.onActivitiesChange})
      : super(key: key);

  final List<Activity> activities;
  final ActivitiesCallBack onActivitiesChange;

  void onUpdateActivity(Activity activity) {
    final index =
    activities.indexWhere((element) => element.title == activity.title);
    activities[index] = activity;
    onActivitiesChange(activities);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: const BoxDecoration(
        color: kWhiteColor,
      ),
      child: Wrap(
        children: activities
            .map((element) => ChoiceItem.button(
            activity: element, onActivityChange: onUpdateActivity))
            .toList(),
      ),
    );
  }
}