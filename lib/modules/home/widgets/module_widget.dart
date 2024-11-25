import 'package:edu_zone/infrastructure/home/models/modules.dart';
import 'package:edu_zone/modules/home/view/videos_screen.dart';
import 'package:edu_zone/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ModuleWidget extends StatelessWidget {
  final Modules module;
  const ModuleWidget({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, VideosScreen.route(id: module.id ?? 1));
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: appColor(context).border,
          ),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      module.title ?? '',
                      style: TextStyle(color: appColor(context).errorText, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      module.description ?? '',
                      style: TextStyle(color: appColor(context).secondaryText, fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
                color: appColor(context).secondaryText?.withOpacity(0.5),
              )
            ],
          )),
    );
  }
}
