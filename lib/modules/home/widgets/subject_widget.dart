import 'package:edu_zone/infrastructure/home/models/subjects.dart';
import 'package:edu_zone/modules/home/view/module_screen.dart';
import 'package:edu_zone/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SubjectWidget extends StatelessWidget {
  final Subjects subjects;
  final int index;
  const SubjectWidget({super.key, required this.index, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, ModuleScreen.route(title: subjects.title ?? "", id: subjects.id ?? 1));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: appColor(context).border,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (subjects.image?.isNotEmpty ?? false)
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  subjects.image!,
                  fit: BoxFit.fill,
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) => _buildPlaceholder(subjects.title, index, context),
                ),
              )
            else
              _buildPlaceholder(subjects.title, index, context),
            const SizedBox(height: 8),
            Text(
              subjects.title ?? '',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Flexible(
              child: Text(
                subjects.description ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: appColor(context).secondaryText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder(String? title, int index, BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.primaries[index % Colors.primaries.length],
      ),
      alignment: Alignment.center,
      child: Text(
        title?.substring(0, 1) ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: appColor(context).black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
