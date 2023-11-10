import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/screens/home/home_state_nofitier.dart';
import 'package:students/utils/app_colors.dart';

import 'package:students/utils/utils.dart';

class HomeScreen extends ConsumerWidget with Utils {
  const HomeScreen({super.key});
//Color(0xfffdefee),
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);
    return Scaffold(
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(4, (index) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: AppColors.bgNav,
            ),
            child: Center(
              child: Text(
                'Khối ${6 + index}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          );
        }),
      ),
    );
  }
}
