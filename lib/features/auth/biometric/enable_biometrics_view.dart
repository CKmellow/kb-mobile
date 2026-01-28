import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/typography.dart';

class EnableBiometricsView extends StatelessWidget {
  const EnableBiometricsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    final bgLight = const Color(0xFFF6F8F6);
    final bgDark = const Color(0xFF102210);
    final cardDark = const Color(0xFF111811);
    final borderColor = isDark ? Colors.grey[700]! : const Color(0xFFDBE6DB);
    final textSecondary = isDark ? Colors.grey[400]! : const Color(0xFF618961);

    return Scaffold(
      backgroundColor: isDark ? bgDark : bgLight,
      body: Center(
        child: Container(
          width: 480,
          constraints: const BoxConstraints(minHeight: 600),
          decoration: BoxDecoration(
            color: isDark ? bgDark : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 32,
                offset: const Offset(0, 8),
              ),
            ],
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            children: [
              // TopAppBar
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).maybePop(),
                      child: Container(
                        width: 48,
                        height: 48,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: isDark ? Colors.white : cardDark,
                          size: 24,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 48),
                        child: Text(
                          'KB MOBILE',
                          style: TextStyle(
                            fontFamily: AppTypography.fontFamily,
                            fontWeight: AppTypography.bold,
                            fontSize: 14,
                            color: (isDark ? Colors.white : cardDark)
                                .withOpacity(0.4),
                            letterSpacing: 2.0,
                            height: 1.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 32),
                      // Illustration
                      Center(
                        child: Container(
                          width: 192,
                          height: 192,
                          decoration: BoxDecoration(
                            color: primary.withOpacity(0.10),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: primary.withOpacity(0.15),
                                blurRadius: 40,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: primary.withOpacity(0.20),
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Container(
                                width: 128,
                                height: 128,
                                decoration: BoxDecoration(
                                  color: primary.withOpacity(0.20),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.fingerprint,
                                    color: primary,
                                    size: 80,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Headline
                      Text(
                        'Secure Your Account',
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontWeight: AppTypography.bold,
                          fontSize: 32,
                          color: isDark ? Colors.white : cardDark,
                          height: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      // BodyText
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Use your biometrics for quick sign-in and to authorize transactions securely without typing your PIN every time.',
                          style: TextStyle(
                            fontFamily: AppTypography.fontFamily,
                            fontWeight: AppTypography.regular,
                            fontSize: 16,
                            color: (isDark ? Colors.white : cardDark)
                                .withOpacity(0.7),
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Action Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primary,
                                  minimumSize: const Size.fromHeight(56),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 8,
                                  shadowColor: primary.withOpacity(0.2),
                                ),
                                child: const Text(
                                  'Enable Biometrics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF111811),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.transparent),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  minimumSize: const Size.fromHeight(56),
                                ),
                                child: Text(
                                  'Skip for now',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: (isDark ? Colors.white : cardDark)
                                        .withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Footer Trust Badge
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.verified_user,
                                color: primary.withOpacity(0.6),
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Bank-Grade Security',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontFamily,
                                  fontWeight: AppTypography.bold,
                                  fontSize: 12,
                                  color: primary.withOpacity(0.6),
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 4,
                            width: 128,
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.white.withOpacity(0.05)
                                  : Colors.grey[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: FractionallySizedBox(
                                widthFactor: 2 / 3,
                                child: Container(
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
