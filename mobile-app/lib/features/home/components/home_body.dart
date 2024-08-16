import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 0.2.sw,
          height: 1.sh,
          color: const Color.fromRGBO(35, 39, 42, 1),
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(10, (index) {
                return Text('$index');
              }),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1.sh,
            decoration: const BoxDecoration(
                color: AppColor.black5,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                )),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(20, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$index'),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
