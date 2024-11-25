import 'package:edu_zone/infrastructure/home/notifier/module_notifier.dart';
import 'package:edu_zone/modules/home/widgets/module_widget.dart';
import 'package:edu_zone/themes/app_theme.dart';
import 'package:edu_zone/themes/widgets/app_transition.dart';
import 'package:edu_zone/themes/widgets/bottom_navigation_bar.dart';
import 'package:edu_zone/themes/widgets/common_appbar.dart';
import 'package:edu_zone/themes/widgets/loader_widget.dart';
import 'package:edu_zone/themes/widgets/search_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModuleScreen extends StatelessWidget {
  final String title;
  final int id;
  const ModuleScreen({super.key, required this.title, required this.id});

  static Route route({required String title, required int id}) {
    return AppFadeTransition(
        page: ModuleScreen(
      title: title,
      id: id,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor(context).fullWhite,
      bottomNavigationBar: const BottomNavigation(activeIcon: ""),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: CommonAppbar(
          toolbarHeight: 65,
          title: "$title Modules",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(
              hint: 'Search',
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final subjectState = ref.watch(moduleNotifierProvider(subjectId: id));
                return subjectState.when(
                  data: (module) {
                    return ListView.builder(
                        itemCount: module.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ModuleWidget(
                            module: module[index],
                          );
                        });
                  },
                  error: (error, st) {
                    return const SizedBox();
                  },
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: LoaderWidget(),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
