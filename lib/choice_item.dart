import 'package:flutter/material.dart';

import 'core/activity.dart';
import 'core/helpers.dart';

enum ChoiceItemOption { box, button }

class ChoiceItem extends StatelessWidget {
  const ChoiceItem._(
      {Key? key,
      required this.activity,
      this.onActivityChange,
      this.option = ChoiceItemOption.button})
      : super(key: key);

  final Activity activity;
  final ActivityCallBack? onActivityChange;
  final ChoiceItemOption option;

  factory ChoiceItem.box(
      {required Activity activity, ActivityCallBack? onActivityChange}) {
    return ChoiceItem._(
        activity: activity,
        onActivityChange: onActivityChange,
        option: ChoiceItemOption.box);
  }

  factory ChoiceItem.button(
      {required Activity activity, ActivityCallBack? onActivityChange}) {
    return ChoiceItem._(
      activity: activity,
      onActivityChange: onActivityChange,
      option: ChoiceItemOption.button,
    );
  }

  Color get backgroundColor =>
      (option == ChoiceItemOption.button && activity.isSelected)
          ? kOrangeColor
          : kGreyColor;

  @override
  Widget build(BuildContext context) {
    final baseChild =
        ChoiceItemBase(backgroundColor: backgroundColor, activity: activity);

    switch (option) {
      case ChoiceItemOption.box:
        return baseChild;
      case ChoiceItemOption.button:
        return GestureDetector(
          onTap: () {
            activity.toggle();
            onActivityChange?.call(activity);
          },
          child: baseChild,
        );
    }
  }
}

class ChoiceItemBase extends StatelessWidget {
  const ChoiceItemBase({
    Key? key,
    required this.backgroundColor,
    required this.activity,
  }) : super(key: key);

  final Color backgroundColor;
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(7.5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(activity.title, style: context.textTheme.bodyText1,));
  }
}
