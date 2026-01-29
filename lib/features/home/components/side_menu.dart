import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/typography.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    final cardDark = const Color(0xFF111811);
    final bgColor = isDark ? const Color(0xFF1A1A1A) : Colors.white;
    final textColor = isDark ? Colors.white : cardDark;
    final secondaryTextColor = isDark ? Colors.grey[400]! : Colors.grey[600]!;
    final borderColor = isDark ? Colors.grey[800]! : const Color(0xFFE5E7EB);
    final surfaceColor = isDark ? Colors.grey[900]! : const Color(0xFFF8FAF8);
    final iconBgColor = isDark ? Colors.grey[800]! : const Color(0xFFE8F5E8);

    // Responsive sizing based on screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = screenWidth * 0.78;
    final logoSize = drawerWidth * 0.18;
    final iconPadding = drawerWidth * 0.045;
    final horizontalPadding = drawerWidth * 0.06;
    final sectionSpacing = drawerWidth * 0.04;

    const userName = "Mike";
    const lastLogin = "Last login: Nov 24, 2024, 10:30 AM";

    return SizedBox(
      width: drawerWidth,
      child: Drawer(
        backgroundColor: bgColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isDark
                      ? [const Color(0xFF1A2A1A), const Color(0xFF1A1A1A)]
                      : [const Color(0xFFF0F8F0), Colors.white],
                ),
                border: Border(
                  bottom: BorderSide(color: borderColor.withOpacity(0.5)),
                ),
              ),
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                drawerWidth * 0.15,
                horizontalPadding,
                drawerWidth * 0.08,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(logoSize * 0.24),
                    decoration: BoxDecoration(
                      color: bgColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: primary.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/kb_logo.png',
                      height: logoSize,
                      width: logoSize,
                    ),
                  ),
                  SizedBox(height: drawerWidth * 0.045),
                  Text(
                    userName,
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: drawerWidth * 0.07,
                      color: textColor,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: drawerWidth * 0.025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: drawerWidth * 0.035,
                        color: secondaryTextColor,
                      ),
                      SizedBox(width: drawerWidth * 0.015),
                      Text(
                        lastLogin,
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: drawerWidth * 0.032,
                          color: secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: sectionSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        drawerWidth * 0.02,
                        horizontalPadding,
                        drawerWidth * 0.025,
                      ),
                      child: Text(
                        'ACCOUNT',
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: drawerWidth * 0.028,
                          color: secondaryTextColor,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    _MenuItem(
                      icon: Icons.person_outline,
                      label: 'Profile',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      textColor: textColor,
                      iconBgColor: iconBgColor,
                      primary: primary,
                      drawerWidth: drawerWidth,
                    ),
                    _MenuItem(
                      icon: Icons.lock_outline,
                      label: 'Security',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      textColor: textColor,
                      iconBgColor: iconBgColor,
                      primary: primary,
                      drawerWidth: drawerWidth,
                    ),
                    _MenuItem(
                      icon: Icons.notifications,
                      label: 'Alerts & Notifications',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      textColor: textColor,
                      iconBgColor: iconBgColor,
                      primary: primary,
                      badgeCount: 3,
                      drawerWidth: drawerWidth,
                    ),
                    SizedBox(height: drawerWidth * 0.03),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        drawerWidth * 0.02,
                        horizontalPadding,
                        drawerWidth * 0.025,
                      ),
                      child: Text(
                        'SERVICES',
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: drawerWidth * 0.028,
                          color: secondaryTextColor,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    _MenuItem(
                      icon: Icons.location_on_outlined,
                      label: 'Branch Locator',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      textColor: textColor,
                      iconBgColor: iconBgColor,
                      primary: primary,
                      highlight: true,
                      drawerWidth: drawerWidth,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: surfaceColor,
                border: Border(
                  top: BorderSide(color: borderColor.withOpacity(0.5)),
                ),
              ),
              padding: EdgeInsets.fromLTRB(
                horizontalPadding * 0.9,
                sectionSpacing,
                horizontalPadding * 0.9,
                drawerWidth * 0.08,
              ),
              child: Column(
                children: [
                  _MenuItem(
                    icon: Icons.headset_mic_outlined,
                    label: 'Contact Us',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    textColor: textColor,
                    iconBgColor: iconBgColor,
                    primary: primary,
                    borderRadius: drawerWidth * 0.03,
                    drawerWidth: drawerWidth,
                  ),
                  SizedBox(height: drawerWidth * 0.02),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(drawerWidth * 0.03),
                      border: Border.all(color: Colors.red.withOpacity(0.2)),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(drawerWidth * 0.03),
                        onTap: () {
                          Navigator.pop(context);
                          _showLogoutConfirmation(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding * 0.8,
                            vertical: drawerWidth * 0.04,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(iconPadding * 0.7),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(
                                    drawerWidth * 0.025,
                                  ),
                                ),
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                  size: drawerWidth * 0.055,
                                ),
                              ),
                              SizedBox(width: drawerWidth * 0.04),
                              Expanded(
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    fontFamily: AppTypography.fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: drawerWidth * 0.042,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.red.withOpacity(0.6),
                                size: drawerWidth * 0.05,
                              ),
                            ],
                          ),
                        ),
                      ),
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

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.logout, color: Colors.red, size: 24),
            ),
            const SizedBox(width: 12),
            const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        content: const Text(
          'Are you sure you want to logout from your account?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color textColor;
  final Color iconBgColor;
  final Color primary;
  final bool highlight;
  final int? badgeCount;
  final double borderRadius;
  final double drawerWidth;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.textColor,
    required this.iconBgColor,
    required this.primary,
    this.highlight = false,
    this.badgeCount,
    this.borderRadius = 12,
    required this.drawerWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconContainerSize = drawerWidth * 0.1;
    final iconSize = drawerWidth * 0.055;
    final horizontalPad = drawerWidth * 0.04;
    final verticalPad = drawerWidth * 0.035;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: drawerWidth * 0.04,
        vertical: drawerWidth * 0.005,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: highlight ? primary.withOpacity(0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: highlight
              ? Border.all(color: primary.withOpacity(0.2))
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPad,
                vertical: verticalPad,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(iconContainerSize * 0.25),
                    decoration: BoxDecoration(
                      color: highlight ? primary.withOpacity(0.2) : iconBgColor,
                      borderRadius: BorderRadius.circular(
                        iconContainerSize * 0.2,
                      ),
                    ),
                    child: Icon(
                      icon,
                      color: highlight ? primary : (textColor.withOpacity(0.7)),
                      size: iconSize,
                    ),
                  ),
                  SizedBox(width: drawerWidth * 0.035),
                  Expanded(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontWeight: highlight
                            ? FontWeight.w600
                            : FontWeight.w500,
                        fontSize: drawerWidth * 0.038,
                        color: textColor,
                        letterSpacing: highlight ? -0.2 : 0,
                      ),
                    ),
                  ),
                  if (badgeCount != null)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: drawerWidth * 0.02,
                        vertical: drawerWidth * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '$badgeCount',
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: drawerWidth * 0.028,
                          color: const Color(0xFF111811),
                        ),
                      ),
                    ),
                  if (badgeCount == null)
                    Icon(
                      Icons.chevron_right,
                      color: textColor.withOpacity(0.3),
                      size: drawerWidth * 0.05,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
