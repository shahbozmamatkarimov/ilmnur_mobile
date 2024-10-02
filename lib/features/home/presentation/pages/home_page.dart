import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_mobile/config/routes/router.gr.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/widgets/w_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ilmnur_mobile/features/home/data/data_sources/group/group_service.dart';
import 'package:ilmnur_mobile/features/home/data/repositories/impl_group_repo.dart';
import 'package:ilmnur_mobile/features/home/presentation/bloc/group/group_bloc.dart';
import 'package:ilmnur_mobile/features/home/presentation/widgets/WGroupCard.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          BlocProvider(
            create: (context) => GroupBloc(
              groupRepo: ImplGroupRepo(
                groupService: GroupService.create(),
              ),
            ),
            child: BlocBuilder<GroupBloc, GroupState>(
              builder: (context, state) {
                if (state is GroupLoading) {
                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        for (var _ in [1, 2, 3, 4, 5, 6, 7, 8, 9])
                          Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(
                                0.3), // Background color of the skeleton
                            highlightColor: Colors.grey.withOpacity(
                                0.1), // Highlight color of the skeleton
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.white,
                              ),
                              height: 200,
                              constraints: const BoxConstraints(
                                maxWidth: 350, // Set the maximum width to 200
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                } else if (state is LoadedGroupData) {
                  final groups = state.groups;
                  return SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.spaceEvenly,
                      // runAlignment: WrapAlignment.spaceBetween,
                      // crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for (dynamic group in groups) WGroupCard(group: group)
                      ],
                    ),
                  );
                } else if (state is ErrorLoadingGroupData) {
                  return Center(
                    child: Text(
                        'Error loading category data: ${state.errorMessage}'),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
