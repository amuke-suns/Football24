import 'package:flutter/material.dart';

class SearchActionButton extends StatelessWidget {
  const SearchActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        const snackBar = SnackBar(
          content: Text('Searching not supported yet'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
