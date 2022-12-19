

import 'package:esgi_td/core/helpers.dart';
import 'package:flutter/material.dart';

import 'choice_item.dart';
import 'core/activity.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.activities}) : super(key: key);

  final List<Activity> activities;

  bool get isAtLeastOneSelected =>
      activities.any((activity) => activity.isSelected);

  List<Widget> buildSelectedWidget() {
    return activities
        .where((activity) => activity.isSelected)
        .map((activity) => ChoiceItem.box(activity: activity))
        .toList();
  }

  Widget buildUnselectedWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        'Cliquez sur les choix en dessous !',
        style: context.primaryTextTheme.bodyText1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Wrap(
        children: [
          SizedBox(
            width: context.width,
            child: Text(
              'Vos choix',
              style: context.primaryTextTheme.headline5,
            ),
          ),
          if (isAtLeastOneSelected)
            ...buildSelectedWidget()
          else
            buildUnselectedWidget(context),
        ],
      ),
    );
  }
}

