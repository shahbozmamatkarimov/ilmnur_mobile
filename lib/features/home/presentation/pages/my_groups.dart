import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/widgets/w_button.dart';
import 'package:ilmnur_mobile/features/home/presentation/bloc/group/group_bloc.dart';
import 'package:ilmnur_mobile/features/home/presentation/widgets/WGroupCard.dart';
import 'package:ilmnur_mobile/features/home/presentation/widgets/add_group.dart';

class MyCoursesView extends StatelessWidget {
  MyCoursesView({Key? key}) : super(key: key);

  void _showInputModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext modalContext) {
        return BlocProvider.value(
          value: BlocProvider.of<GroupBloc>(context),
          child: AddGroupModal(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final groupState = context.watch<GroupBloc>().state;
    if (groupState is LoadedGroupData) {
      final my_groups = groupState.my_groups;
      return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.spaceEvenly,
            // runAlignment: WrapAlignment.spaceBetween,
            // crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (dynamic my_group in my_groups) WGroupCard(group: my_group),
              WButton(
                text: "",
                verticalPadding: 0,
                horizontalPadding: 0,
                onTap: () => _showInputModal(context),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: AppColors.mainColor,
                  strokeWidth: 1,
                  dashPattern: const [5, 5],
                  strokeCap: StrokeCap.round,
                  radius: const Radius.circular(8),
                  child: Container(
                    height: 370,
                    width: 350,
                    decoration: const BoxDecoration(),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/icon/add.svg"),
                        const Text(
                          "Add new course",
                          style: TextStyle(
                              fontSize: 12, color: AppColors.mainColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
    // Column(
    //   children: [
    //     WButton(
    //       text: "",
    //       onTap: () => _showInputModal(context),
    //       child: DottedBorder(
    //         borderType: BorderType.RRect,
    //         color: AppColors.mainColor,
    //         strokeWidth: 1,
    //         dashPattern: [5, 5],
    //         strokeCap: StrokeCap.round,
    //         radius: const Radius.circular(8),
    //         child: Container(
    //           height: 400,
    //           width: 300,
    //           decoration: BoxDecoration(),
    //           clipBehavior: Clip.hardEdge,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               SvgPicture.asset("assets/svg/icon/add.svg"),
    //               const Text(
    //                 "Add new course",
    //                 style: TextStyle(fontSize: 12, color: AppColors.mainColor),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
