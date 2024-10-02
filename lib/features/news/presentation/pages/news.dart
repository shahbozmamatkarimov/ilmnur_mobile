import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/util/responsive.dart';
import 'package:ilmnur_mobile/core/widgets/w_tabbar.dart';
import 'package:ilmnur_mobile/features/course/presentation/pages/chat.dart';
import 'package:ilmnur_mobile/features/course/presentation/pages/reyting.dart';
import 'package:ilmnur_mobile/features/course/presentation/pages/settings.dart';
import 'package:ilmnur_mobile/features/news/presentation/widgets/WNews.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              for (int i in [1, 2, 3, 4, 5, 6]) const WNews()
            ],
          ),
        ),
      ),
    );
  }
}
