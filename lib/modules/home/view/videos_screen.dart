import 'package:edu_zone/infrastructure/home/notifier/video_notifier.dart';
import 'package:edu_zone/modules/home/widgets/video_widget.dart';
import 'package:edu_zone/themes/app_theme.dart';
import 'package:edu_zone/themes/widgets/app_transition.dart';
import 'package:edu_zone/themes/widgets/bottom_navigation_bar.dart';
import 'package:edu_zone/themes/widgets/common_appbar.dart';
import 'package:edu_zone/themes/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideosScreen extends StatelessWidget {
  final int id;
  const VideosScreen({super.key, required this.id});

  static Route route({required int id}) {
    return AppFadeTransition(
        page: VideosScreen(
      id: id,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor(context).fullWhite,
      bottomNavigationBar: const BottomNavigation(activeIcon: ""),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: CommonAppbar(
          toolbarHeight: 65,
          title: "Videos",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer(
          builder: (context, ref, child) {
            final mediaProvider = ref.watch(videoNotifierProvider(moduleId: id));
            return mediaProvider.when(
                data: (mediaData) {
                  return SingleChildScrollView(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemCount: mediaData.length,
                      itemBuilder: (context, index) {
                        return VideoWidget(
                          video: mediaData[index],
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) => const SizedBox(),
                loading: () => const LoaderWidget());
          },
        ),
      ),
    );
  }
}
