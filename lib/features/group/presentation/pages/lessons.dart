import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilmnur_mobile/core/resources/app_colors.dart';
import 'package:ilmnur_mobile/core/widgets/w_button.dart';

class Lessons extends StatelessWidget {
  const Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Assalomu alaykum, Asaloy",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            const Text(
              "Bugun nimani o‘rganmoqchisiz?",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.c_66),
            ),
            const SizedBox(height: 24),
            const Text(
              "Darsliklar",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            for (int _ in [1, 2, 3, 4, 5, 6])
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 20),
                // height: 168,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      offset: Offset(0, 2),
                      blurRadius: 16,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Matematika",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(36, 36, 36, 1),
                              fontFamily: 'SF Pro Text',
                              fontSize: 24,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              SvgPicture.asset("assets/svg/lesson/play.svg"),
                              const SizedBox(width: 10),
                              Text("2"),
                              const SizedBox(width: 16),
                              SvgPicture.asset("assets/svg/lesson/clock.svg"),
                              const SizedBox(width: 10),
                              Text("23 soat"),
                            ],
                          ),
                          const SizedBox(height: 20),
                          WButton(
                            text: "Davom etish",
                            verticalPadding: 8,
                            horizontalPadding: 12,
                            borderRadius: 10,
                            fontSize: 16,
                            onTap: () => {},
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.white,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                      width: 100,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicatorClass(),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Barchasi',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: Column(
                                      children: [
                                        Text(
                                          '2',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF242424),
                                          ),
                                        ),
                                        Divider(
                                          color: Color(0xFF929292),
                                          height: 1,
                                          thickness: 1,
                                        ),
                                        Text(
                                          "35",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CircularProgressIndicatorClass extends StatefulWidget {
  const CircularProgressIndicatorClass({super.key});

  @override
  _CircularProgressIndicatorClassState createState() =>
      _CircularProgressIndicatorClassState();
}

class _CircularProgressIndicatorClassState
    extends State<CircularProgressIndicatorClass> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.transparent,
        body: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: 0.45,
            strokeWidth: 2,
            backgroundColor:
                Color(0XFFEDEDED), // Color behind the progress indicator
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF40E746)),
          ),
        ));
  }
}
