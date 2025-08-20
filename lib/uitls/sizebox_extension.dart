import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedBoxExtension on num {
  /// Responsive height
  SizedBox get ph => SizedBox(height: h.h);

  /// Responsive width
  SizedBox get pw => SizedBox(width: w.w);

  /// Shortcut for both width & height
  SizedBox get s => SizedBox(height: h, width: w);
}
