import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/typography.dart';
import '../services/send/send_money/send_money_view.dart';
import 'components/send_menu_sheet.dart';
import 'components/pay_menu_sheet.dart';
import '../transactions/transaction_history_page.dart';
import '../deposit/deposit_page.dart';
import '../services/airtime/buy_airtime_view.dart';
import '../services/StandingOrder/home/standing_order_home_view.dart';

// Transaction Item Widget
class _TransactionItem extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String subtitle;
  final String amount;
  final Color? amountColor;
  const _TransactionItem({
    required this.icon,
    this.iconColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.amountColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardDark = const Color(0xFF111811);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? (isDark ? Colors.white : cardDark),
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isDark ? Colors.white : cardDark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: amountColor ?? (isDark ? Colors.white : cardDark),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _balanceVisible = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    final bgLight = const Color(0xFFF6F8F6);
    final bgDark = const Color(0xFF102210);
    final cardDark = const Color(0xFF111811);
    final borderColor = isDark ? Colors.grey[800]! : const Color(0xFFE5E7EB);
    final userName = "Mike";
    final accountNumber = "123456789";
    final balance = "145,200.50";

    return Scaffold(
      backgroundColor: isDark ? bgDark : bgLight,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: (isDark ? bgDark : bgLight).withOpacity(0.8),
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? Colors.grey[800]! : Colors.grey[100]!,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[700] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primary, width: 2),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuCkUYHHL49AAy_siuIFjBsQQx-q2f7VS8jaWC3e_DhNV3uXGXDWNjG6Q2Ouke1Rt_grvszLPUF_C3q8c3_Mp3TqdbjLgwBc87Q7EHIQ90TojiQM6OA_xqsaxFeJNstAD46-ZvMahmcUticWDfxcYjQtYvZ8gDyetdkh-BuQbMSvSIv5N8UcVee_khWQhxYiWGE86WjFI4W6cE9jfb7-ZO24ewFnARijef8yxoqc_P0vmRwD5eTOb6BSEh3WSOAWH4euhWfdsbHC6kC2',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good morning,',
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontWeight: AppTypography.medium,
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        userName,
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontWeight: AppTypography.bold,
                          fontSize: 16,
                          color: isDark ? Colors.white : cardDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Account Card
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: isDark ? Colors.grey[900] : Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: borderColor),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 24,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Main Account – $accountNumber',
                                  style: TextStyle(
                                    fontFamily: AppTypography.fontFamily,
                                    fontWeight: AppTypography.medium,
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'KES',
                                      style: TextStyle(
                                        fontFamily: AppTypography.fontFamily,
                                        fontWeight: AppTypography.bold,
                                        fontSize: 20,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      _balanceVisible ? balance : '••••••',
                                      key: const ValueKey('balance'),
                                      style: TextStyle(
                                        fontFamily: AppTypography.fontFamily,
                                        fontWeight: AppTypography.bold,
                                        fontSize: 32,
                                        color: isDark ? Colors.white : cardDark,
                                        letterSpacing: -1.5,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    IconButton(
                                      icon: Icon(
                                        _balanceVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey[400],
                                        size: 28,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _balanceVisible = !_balanceVisible;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const TransactionHistoryPage(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primary,
                                          foregroundColor: cardDark,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                          elevation: 2,
                                        ),
                                        child: const Text(
                                          'Statement',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const DepositPage(),
                                            ),
                                          );
                                        },
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: primary),
                                          foregroundColor: primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Deposit',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Decorative circle
                          Positioned(
                            right: -48,
                            top: -48,
                            child: Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                color: primary.withOpacity(0.10),
                                shape: BoxShape.circle,
                                // blur effect
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Quick Actions
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Quick Actions',
                          style: TextStyle(
                            fontFamily: AppTypography.fontFamily,
                            fontWeight: AppTypography.bold,
                            fontSize: 20,
                            color: isDark ? Colors.white : cardDark,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.7,
                        children: [
                          _QuickAction(
                            icon: Icons.send, // Send
                            label: 'Send',
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                ),
                                builder: (context) => const SendMenuSheet(),
                              );
                            },
                          ),
                          _QuickAction(
                            icon: Icons.receipt, // Pay
                            label: 'Pay',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PayBillsPage(),
                                ),
                              );
                            },
                          ),
                          _QuickAction(
                            icon: Icons.phone_iphone, // Buy Airtime
                            label: 'Buy Airtime',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const BuyAirtimeView(),
                                ),
                              );
                            },
                          ),
                          _QuickAction(
                            icon: Icons.repeat, // Standing order
                            label: 'Standing order',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const StandingOrderHomeView(),
                                ),
                              );
                            },
                            highlight: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Recent Transactions Header
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Transactions',
                            style: TextStyle(
                              fontFamily: AppTypography.fontFamily,
                              fontWeight: AppTypography.bold,
                              fontSize: 18,
                              color: isDark ? Colors.white : cardDark,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransactionHistoryPage(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: primary,
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            child: const Text('See All'),
                          ),
                        ],
                      ),
                    ),

                    // Recent Transactions List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: const [
                          _TransactionItem(
                            icon: Icons.wifi,
                            iconColor: null,
                            title: 'Zuku Fiber',
                            subtitle: 'Today, 10:45 AM',
                            amount: '-3,500.00',
                            amountColor: null,
                          ),
                          SizedBox(height: 8),
                          _TransactionItem(
                            icon: Icons.call_received,
                            iconColor: AppColors.primary,
                            title: 'Transfer from John D.',
                            subtitle: 'Yesterday',
                            amount: '+1,200.00',
                            amountColor: AppColors.primary,
                          ),
                          SizedBox(height: 8),
                          _TransactionItem(
                            icon: Icons.shopping_bag,
                            iconColor: null,
                            title: 'Naivas Supermarket',
                            subtitle: 'Nov 22, 2023',
                            amount: '-2,450.00',
                            amountColor: null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark
              ? cardDark.withOpacity(0.95)
              : Colors.white.withOpacity(0.95),
          border: Border(
            top: BorderSide(
              color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
            ),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavButton(
              icon: Icons.home,
              label: 'Home',
              active: true,
              onTap: () {},
              primary: primary,
            ),
            // _NavButton(
            //   icon: Icons.credit_card,
            //   label: 'Cards',
            //   active: false,
            //   onTap: () {},
            //   primary: primary,
            // ),
            _NavButton(
              icon: Icons.miscellaneous_services,
              label: 'Services',
              active: false,
              onTap: () {},
              primary: primary,
            ),
            _NavButton(
              icon: Icons.support_agent,
              label: 'Support',
              active: false,
              onTap: () {},
              primary: primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool highlight;
  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
    this.highlight = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    return Material(
      color: highlight
          ? primary.withOpacity(0.10)
          : (isDark ? Colors.grey[900] : Colors.white),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: highlight
                  ? primary.withOpacity(0.2)
                  : (isDark ? Colors.grey[800]! : const Color(0xFFE5E7EB)),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: isDark ? Colors.white : Colors.black,
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;
  final Color primary;
  const _NavButton({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
    required this.primary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active ? primary : const Color(0xFF9CA3AF),
            size: 28,
          ),
          const SizedBox(height: 2),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: active ? primary : const Color(0xFF9CA3AF),
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
