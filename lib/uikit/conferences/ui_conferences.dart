import 'package:flutter/material.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/conference.dart';
import 'package:intl/intl.dart';

class UiConferences extends StatelessWidget {
  const UiConferences({
    super.key,
    required this.conferences,
    required this.onTap,
  });

  final List<Conference> conferences;
  final ValueChanged<Conference> onTap;

  @override
  Widget build(BuildContext context) => ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: conferences.length + 1,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => index == 0
            ? const UiConferencesHeader()
            : UiConferencesItem(
                conference: conferences[index - 1],
                onTap: onTap,
              ),
      );
}

class UiConferencesHeader extends StatelessWidget {
  const UiConferencesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final label = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        );

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            'Дата',
            style: label,
          ),
        ),
        Expanded(
          child: Text(
            'Название',
            style: label,
          ),
        ),
        const Expanded(
          flex: 2,
          child: SizedBox(),
        )
      ],
    );
  }
}

class UiConferencesItem extends StatelessWidget {
  const UiConferencesItem({
    super.key,
    required this.conference,
    required this.onTap,
  });

  final Conference conference;
  final ValueChanged<Conference> onTap;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              DateFormat(DateFormat.YEAR_MONTH_DAY).format(conference.dateTime),
            ),
          ),
          Expanded(
            child: Text(
              conference.name,
            ),
          ),
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: () => onTap(conference),
              child: const Text('Начать встречу'),
            ),
          )
        ],
      );
}
