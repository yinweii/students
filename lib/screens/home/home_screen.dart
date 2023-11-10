import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/common/core/routes.dart';
import 'package:students/screens/class/class_screen.dart';
import 'package:students/screens/home/home_state_nofitier.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/dialog.dart';

import 'package:students/utils/utils.dart';

class HomeScreen extends ConsumerWidget with Utils {
  const HomeScreen({super.key});
//Color(0xfffdefee),
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              ShowSimpleDialog.topShowGeneralDialog(
                context,
                childWidget: SizedBox(
                  // height: screenHeight(context) * 0.5,
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight(context) * 0.6,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
        // Generate 100 widgets that display their index in the List.
        children: List.generate(4, (index) {
          return GestureDetector(
            onTap: () => push(context, const ClassScreen()),
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.bgNav,
              ),
              child: Center(
                child: Text(
                  'Khối ${6 + index}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
