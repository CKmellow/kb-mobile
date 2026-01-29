import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/typography.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardDark = const Color(0xFF111811);
    final bgColor = isDark ? const Color(0xFF1A1A1A) : Colors.white;
    final textColor = isDark ? Colors.white : cardDark;
    final secondaryTextColor = Colors.grey[500];
    final borderColor = isDark ? Colors.grey[800]! : const Color(0xFFE5E7EB);

    // Mock user data - replace with actual user data from provider/controller
    const userName = "Mike";
    const lastLogin = "Last login: Nov 24, 2024, 10:30 AM";

    return Drawer(
      backgroundColor: bgColor,
      child: SafeArea(
        child: Column(
          children: [
            // Top Section: KB Logo, User Name, Last Login
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: borderColor)),
              ),
              child: Column(
                children: [
                  // KB Logo
                  Image.asset(
                    'assets/images/kb_logo.png',
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(height: 16),
                  // User Name
                  Text(
                    userName,
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontWeight: AppTypography.bold,
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Last Login
                  Text(
                    lastLogin,
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontWeight: AppTypography.medium,
                      fontSize: 12,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),

            // Second Section: Menu Options
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    _MenuItem(
                      icon: Icons.person_outline,
                      label: 'Profile',
                      onTap: () {
                        Navigator.pop(context);
                        // TODO: Navigate to Profile screen
                      },
                      textColor: textColor,
                    ),
                    _MenuItem(
                      icon: Icons.lock_outline,
                      label: 'Security',
                      onTap: () {
                        Navigator.pop(context);
                        // TODO: Navigate to Security screen
                      },
                      textColor: textColor,
                    ),
                    _MenuItem(
                      icon: Icons.notifications_outlined,
                      label: 'Alerts & Notifications',
                      onTap: () {
                        Navigator.pop(context);
                        // TODO: Navigate to Alerts screen
                      },
                      textColor: textColor,
                    ),
                    _MenuItem(
                      icon: Icons.location_on_outlined,
                      label: 'Branch Locator',
                      onTap: () {
                        Navigator.pop(context);
                        // TODO: Navigate to Branch Locator screen
                      },
                      textColor: textColor,
                      highlight: true,
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Section: Contact Us and Logout
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: borderColor)),
              ),
              child: Column(
                children: [
                  _MenuItem(
                    icon: Icons.headset_mic_outlined,
                    label: 'Contact Us',
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to Contact Us screen
                    },
                    textColor: textColor,
                  ),
                  const SizedBox(height: 8),
                  _MenuItem(
                    icon: Icons.logout,
                    label: 'Logout',
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Implement logout logic
                      _showLogoutConfirmation(context);
                    },
                    textColor: Colors.red,
                    iconColor: Colors.red,
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
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement actual logout
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
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
  final Color? iconColor;
  final bool highlight;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.textColor,
    this.iconColor,
    this.highlight = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.primary;

    return Material(
      color: highlight ? primary.withOpacity(0.10) : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor ?? (highlight ? primary : Colors.grey[600]),
                size: 24,
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: textColor,
                ),
              ),
              const Spacer(),
              Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
