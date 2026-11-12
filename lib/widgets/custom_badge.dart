import 'package:flutter/material.dart';

import 'package:wss_workshop_manager/utils/app_colors.dart';

class CustomBadge extends StatelessWidget {
  final bool isAvailable;

  const CustomBadge({super.key, required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isAvailable ? AppColors.successBg : AppColors.warningBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isAvailable ? 'Available' : 'Under Maintenance',
        style: TextStyle(
          color: isAvailable ? AppColors.successText : AppColors.warningText,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
