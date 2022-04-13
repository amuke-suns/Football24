import 'package:flutter/material.dart';
import 'package:football_news/business_logic/utils/constants.dart';
import 'package:football_news/business_logic/view_models/calendar_view_model.dart';
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
        showDateDialog(context);
      },
    );
  }

  void showDateDialog(BuildContext context) {
    var model = Provider.of<CalendarViewModel>(
      context,
      listen: false,
    );

    SingleChildScrollView(
      child: Container(),
    );

    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          insetPadding: const EdgeInsets.symmetric(vertical: 50, horizontal: 7),
          title: Container(
            padding: const EdgeInsets.all(12),
            child: _buildDialogHeader(context),
            color: Theme.of(context).primaryColor,
          ),
          titlePadding: const EdgeInsets.all(0),
          elevation: 10,
          children: [
            for (int i = 0; i < model.days.length; i++)
              _buildDialogItem(model, i, context),
          ],
        );
      },
    );
  }

  SimpleDialogOption _buildDialogItem(
    CalendarViewModel model,
    int i,
    BuildContext context,
  ) {
    return SimpleDialogOption(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        model.selectedDayIndex = i;
        Navigator.pop(context);
      },
      child: ListTile(
        tileColor: i == model.selectedDayIndex ? Colors.grey : null,
        shape: kListTileBorder,
        title: Text(
          model.days[i].simpleFormat(),
          style: TextStyle(
            fontWeight: i == model.selectedDayIndex ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }

  Row _buildDialogHeader(BuildContext context) {
    return Row(
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
    );
  }
}
