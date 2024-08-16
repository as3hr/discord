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
          color: AppColor.black6,
          child: Column(
            children: List.generate(10, (index) {
              return Text('$index');
            }),
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: AppColor.black5,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                )),
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
      ],
    );
  }
}
