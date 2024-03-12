import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HorizontalSeprater extends StatelessWidget {
  const HorizontalSeprater({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 5.w,);
  }
}
class VerticalSeprater extends StatelessWidget {
  const VerticalSeprater({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 2.h,);
  }
}
