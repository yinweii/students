import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/screens/home/home_state_nofitier.dart';

import 'package:students/utils/utils.dart';

class HomeScreen extends ConsumerWidget with Utils {
  const HomeScreen({super.key});
//Color(0xfffdefee),
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);
    return Scaffold(appBar: AppBar(), body: Container());
  }
}
