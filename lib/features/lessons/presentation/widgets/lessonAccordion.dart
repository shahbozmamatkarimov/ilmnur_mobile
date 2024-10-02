import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilmnur_mobile/config/routes/router.gr.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/features/course/data/models/createcourse.dart';
import 'package:ilmnur_mobile/features/course/presentation/bloc/course/course_bloc.dart';
import 'package:ilmnur_mobile/features/home/data/models/group/group.dart';
import 'package:ilmnur_mobile/features/home/data/models/group/creategroup.dart';
import 'package:ilmnur_mobile/features/home/presentation/bloc/group/group_bloc.dart';
import 'package:ilmnur_mobile/features/lesson/data/models/lesson.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:auto_route/auto_route.dart';

class LessonAccordion extends StatefulWidget {
  int i;
  int isExpanded;
  Function onToggle;
  dynamic lesson;
  LessonAccordion(
      {required this.i,
      required this.isExpanded,
      required this.onToggle,
      required this.lesson});
  @override
  _LessonAccordionState createState() => _LessonAccordionState();
}

class _LessonAccordionState extends State<LessonAccordion> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.lesson.type == 'lesson'
            ? context.router.push(LessonRoute(
                lessonId: widget.lesson.id,
              ))
            : widget.onToggle(widget.lesson.id);
      },
      child: Container(
        key: ValueKey(widget.lesson.id),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.isExpanded == widget.lesson.id
              ? AppColors.mainColor
              : AppColors.backgroundColor,
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            ListTile(
              title: Text(widget.lesson.title),
              trailing: widget.lesson.type == 'lesson'
                  ? const Text("")
                  : Transform.rotate(
                      angle: widget.isExpanded == widget.lesson.id
                          ? 180 * (3.14 / 180)
                          : 0, // Rotate 45 degrees
                      child: SvgPicture.asset("assets/svg/icon/arrow.svg"),
                    ),
              // leading: ReorderableDragStartListener(
              //   index: widget.i,
              //   child: const Icon(Icons.drag_handle),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
