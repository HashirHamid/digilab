import 'package:flutter/material.dart';

import '../DUMMY_DATA.dart';
import '../widgets/category_items.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            width: double.infinity,
            height: 200,
            child: InkWell(
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    'Digital Diagnostic Lab',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal.withOpacity(0.7),
                      Colors.teal,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Container(
            height: 435,
            child: GridView(
              padding: const EdgeInsets.all(25),
              children: DUMMY_CATEGORIES
                  .map(
                    (catData) => CategoryItems(
                      catData.title,
                      catData.color,
                    ),
                  )
                  .toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
