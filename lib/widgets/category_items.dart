import 'package:flutter/material.dart';

import '../screens/diagnosis_screen.dart';

class CategoryItems extends StatelessWidget {
  final Color color;
  final String title;

  CategoryItems(this.title, this.color);

  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(DiagnosisScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
