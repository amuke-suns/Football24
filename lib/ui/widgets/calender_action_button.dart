import 'package:flutter/material.dart';
import 'package:football_news/business_logic/models/models.dart';
import 'package:football_news/business_logic/utils/constants.dart';
import 'package:football_news/business_logic/view_models/games_date_manager.dart';
import 'package:provider/provider.dart';

class CalenderActionButton extends StatelessWidget {
  const CalenderActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.calendar_today),
      onPressed: () {
        var dateManager = Provider.of<AppDateManager>(
          context,
          listen: false,
        );
        showDateDialog(context, dateManager);
      },
    );
  }

  void showDateDialog(BuildContext context, AppDateManager manager) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          insetPadding: const EdgeInsets.symmetric(vertical: 50, horizontal: 7),
          title: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'CALENDAR',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            color: Theme.of(context).primaryColor,
          ),
          titlePadding: const EdgeInsets.all(0),
          elevation: 10,
          children: [
            for (int i = 0; i < manager.days.length; i++)
              SimpleDialogOption(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  manager.selectedDayIndex = i;
                  Navigator.pop(context);
                },
                child: ListTile(
                  tileColor: i == manager.selectedDayIndex ? Colors.grey : null,
                  shape: kListTileBorder,
                  title: Text(
                    manager.days[i].simpleFormat(),
                    style: TextStyle(
                      fontWeight: i == manager.selectedDayIndex
                          ? FontWeight.bold
                          : null,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
