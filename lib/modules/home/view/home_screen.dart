import 'package:edu_zone/infrastructure/home/notifier/subjects_notifier.dart';
import 'package:edu_zone/modules/home/widgets/subject_widget.dart';
import 'package:edu_zone/themes/app_theme.dart';
import 'package:edu_zone/themes/widgets/app_transition.dart';
import 'package:edu_zone/themes/widgets/bottom_navigation_bar.dart';
import 'package:edu_zone/themes/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Route route() {
    return AppFadeTransition(page: const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor(context).fullWhite,
      bottomNavigationBar: const BottomNavigation(activeIcon: 'home'),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: appColor(context).text,
            expandedHeight: 120,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/icons/trogon.png",
                            scale: 5,
                            width: 60,
                            height: 40,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/search.png",
                                width: 20,
                                height: 26,
                              ),
                              const SizedBox(width: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/icons/no_profile_picture_icon.png",
                                  width: 30,
                                  height: 30,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: -50,
                      right: 180,
                      child: Image.asset(
                        "assets/images/appbar_lines.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi, What would you learn today?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Consumer(builder: (context, ref, child) {
                    final subjectState = ref.watch(subjectsNotifierProvider);
                    return subjectState.when(
                      data: (subjects) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemCount: subjects.length,
                          itemBuilder: (context, index) {
                            return SubjectWidget(
                              index: index,
                              subjects: subjects[index],
                            );
                          },
                        );
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
                  Text(
                    "Elevate skills",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: appColor(context).green),
                  ),
                  const Text(
                    "elevate life.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
