import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/typography.dart';
import '../biometric/enable_biometrics_view.dart';
import '../../home/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();
  final TextEditingController _usernameController = TextEditingController();
  int _pinRevealIndex = -1;

  @override
  void dispose() {
    _pinController.dispose();
    _pinFocusNode.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _onPinChanged(String value) {
    setState(() {
      _pinRevealIndex = value.isNotEmpty ? value.length - 1 : -1;
    });
    if (value.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted && _pinController.text.length == value.length) {
          setState(() {
            _pinRevealIndex = -1;
          });
        }
      });
    }
  }

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
          width: 430,
          constraints: const BoxConstraints(minHeight: 600),
          decoration: BoxDecoration(
            color: isDark ? cardDark : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 32,
                offset: const Offset(0, 8),
              ),
            ],
            borderRadius: BorderRadius.zero,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      children: [
                        const SizedBox(width: 40),
                        Expanded(
                          child: Text(
                            'KB Mobile',
                            style: TextStyle(
                              fontFamily: AppTypography.fontFamily,
                              fontWeight: AppTypography.bold,
                              fontSize: 20,
                              color: isDark ? Colors.white : cardDark,
                              letterSpacing: -0.015 * 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.help_outline,
                              color: isDark ? Colors.white : cardDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Logo and Welcome
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 24),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: primary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.account_balance,
                              color: primary,
                              size: 48,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            fontFamily: AppTypography.fontFamily,
                            fontWeight: AppTypography.bold,
                            fontSize: 32,
                            color: isDark ? Colors.white : cardDark,
                            height: 1.1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Securely access your KB Mobile account',
                          style: TextStyle(
                            fontFamily: AppTypography.fontFamily,
                            fontWeight: AppTypography.regular,
                            fontSize: 16,
                            color: textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  // Input Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Phone/Username Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 4,
                                bottom: 8,
                              ),
                              child: Text(
                                'Phone number or username',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontFamily,
                                  fontWeight: AppTypography.bold,
                                  fontSize: 14,
                                  color: isDark ? Colors.white : cardDark,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _usernameController,
                                    decoration: InputDecoration(
                                      hintText: 'e.g. 0712345678',
                                      hintStyle: TextStyle(
                                        color: textSecondary,
                                        fontFamily: AppTypography.fontFamily,
                                        fontSize: 16,
                                      ),
                                      filled: true,
                                      fillColor: isDark
                                          ? Colors.grey[800]
                                          : Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 0,
                                          ),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                        borderSide: BorderSide(
                                          color: borderColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                        borderSide: BorderSide(
                                          color: borderColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                        borderSide: BorderSide(
                                          color: primary.withOpacity(0.5),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: isDark ? Colors.white : cardDark,
                                      fontFamily: AppTypography.fontFamily,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? Colors.grey[800]
                                        : Colors.white,
                                    border: Border.all(
                                      color: borderColor,
                                      width: 1.5,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(
                                    right: 15,
                                    left: 8,
                                  ),
                                  height: 56,
                                  child: Icon(
                                    Icons.person,
                                    color: textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // PIN Section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Enter 4-digit PIN',
                              style: TextStyle(
                                fontFamily: AppTypography.fontFamily,
                                fontWeight: AppTypography.bold,
                                fontSize: 14,
                                color: textSecondary,
                                letterSpacing: 0.015 * 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            // Hidden PIN input
                            TextField(
                              controller: _pinController,
                              focusNode: _pinFocusNode,
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              obscureText: true,
                              autofocus: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: '',
                              ),
                              style: const TextStyle(color: Colors.transparent),
                              cursorColor: Colors.transparent,
                              onChanged: _onPinChanged,
                            ),
                            GestureDetector(
                              onTap: () => FocusScope.of(
                                context,
                              ).requestFocus(_pinFocusNode),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(4, (i) {
                                  final pin = _pinController.text;
                                  final filled = i < pin.length;
                                  final reveal = i == _pinRevealIndex && filled;
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Container(
                                      width: 56,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        color: filled
                                            ? primary.withOpacity(0.05)
                                            : Colors.transparent,
                                        border: Border.all(
                                          color: filled ? primary : borderColor,
                                          width: filled ? 2 : 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Center(
                                        child: filled
                                            ? (reveal
                                                  ? Text(
                                                      pin[i],
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppTypography
                                                                .fontFamily,
                                                        fontWeight:
                                                            AppTypography.bold,
                                                        fontSize: 24,
                                                        color: isDark
                                                            ? Colors.white
                                                            : cardDark,
                                                      ),
                                                    )
                                                  : Container(
                                                      width: 12,
                                                      height: 12,
                                                      decoration: BoxDecoration(
                                                        color: isDark
                                                            ? Colors.white
                                                            : cardDark,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ))
                                            : null,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: () {
                                _pinController.clear();
                                setState(() {});
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: primary,
                                textStyle: TextStyle(
                                  fontFamily: AppTypography.fontFamily,
                                  fontWeight: AppTypography.bold,
                                  fontSize: 14,
                                ),
                              ),
                              child: const Text('Forgot PIN?'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Action Button & Footer
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 48),
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                            );
                          },
                          icon: Icon(Icons.lock, color: cardDark),
                          label: Text(
                            'Secure Login',
                            style: TextStyle(
                              fontFamily: AppTypography.fontFamily,
                              fontWeight: AppTypography.bold,
                              fontSize: 16,
                              color: cardDark,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            minimumSize: const Size.fromHeight(56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 8,
                            shadowColor: primary.withOpacity(0.2),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EnableBiometricsView(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fingerprint, color: primary),
                              const SizedBox(width: 8),
                              Text(
                                'Use Biometrics',
                                style: TextStyle(
                                  fontFamily: AppTypography.fontFamily,
                                  fontWeight: AppTypography.medium,
                                  fontSize: 14,
                                  color: isDark ? Colors.white : cardDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Divider(color: borderColor, thickness: 1),
                        const SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: textSecondary,
                              fontFamily: AppTypography.fontFamily,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Register here',
                                style: TextStyle(
                                  color: primary,
                                  fontWeight: AppTypography.bold,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Footer Decoration
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(height: 4, color: primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
