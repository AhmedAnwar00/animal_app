import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/theme/styles.dart';
import 'package:animal_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SignUpProfileImageUpload extends StatelessWidget {
  const SignUpProfileImageUpload({
    super.key,
    required this.onSelectFilePressed,
  });

  final VoidCallback onSelectFilePressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upload Image For Your Profile',
            style: AppStyles.poppinsRegular16.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: onSelectFilePressed,
            child: CustomPaint(
              foregroundPainter: const _DashedBorderPainter(
                color: AppColors.primary,
                radius: 10,
              ),
              child: Container(
                width: 339,
                height: 200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 32,
                ),
                decoration: BoxDecoration(
                  color: AppColors.uploadFill,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.auth.uploadImage.svg(
                      width: 28,
                      height: 28,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Select file',
                      textAlign: TextAlign.center,
                      style: AppStyles.urbanistMedium16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter({
    required this.color,
    required this.radius,
  });

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 4.0;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0.5, 0.5, size.width - 1, size.height - 1),
          Radius.circular(radius),
        ),
      );

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          paint,
        );
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.radius != radius;
  }
}
