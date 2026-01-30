import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/typography.dart';
import 'components/send_menu_sheet.dart';
import 'components/pay_menu_sheet.dart';
import 'components/side_menu.dart';
import '../transactions/transaction_history_page.dart';
import '../deposit/deposit_page.dart';
import '../payments/airtime/buy_airtime_view.dart';
import '../payments/StandingOrder/home/standing_order_home_view.dart';
import '../payments/menu_services/menu_services_view.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    final bgLight = const Color(0xFFF6F8F6);
    final bgDark = const Color(0xFF102210);
    final cardDark = const Color(0xFF111811);
    final userName = "Mike";

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: isDark ? bgDark : bgLight,
      drawer: const SideMenu(),
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
                  // Profile Avatar - Tappable to open drawer
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Container(
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
                  const Spacer(),
                  // Notification Bell Icon
                  IconButton(
                    onPressed: () {},
                    icon: Stack(
                      children: [
                        Icon(
                          Icons.notifications_none,
                          color: isDark ? Colors.white : cardDark,
                          size: 28,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isDark ? bgDark : bgLight,
                                width: 1,
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

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Account Cards Carousel with Swipe Support
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 160,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: [
                            _AccountCard(
                              accountType: 'Main Account',
                              accountNumber: '123456789',
                              balance: '145,200.50',
                              currency: 'KES',
                              gradientColors: isDark
                                  ? [
                                      const Color(0xFF1A3A1A),
                                      const Color(0xFF0D1F0D),
                                    ]
                                  : [
                                      const Color(0xFFE8F5E8),
                                      const Color(0xFFF0FFF0),
                                    ],
                              cardDark: cardDark,
                              primary: primary,
                              balanceVisible: _balanceVisible,
                              onVisibilityToggle: () {
                                setState(() {
                                  _balanceVisible = !_balanceVisible;
                                });
                              },
                            ),
                            _AccountCard(
                              accountType: 'Savings Account',
                              accountNumber: '987654321',
                              balance: '52,800.00',
                              currency: 'KES',
                              gradientColors: isDark
                                  ? [
                                      const Color(0xFF1A2A3A),
                                      const Color(0xFF0D1520),
                                    ]
                                  : [
                                      const Color(0xFFE5F0F5),
                                      const Color(0xFFF0F8FF),
                                    ],
                              cardDark: cardDark,
                              primary: const Color(0xFF2196F3),
                              balanceVisible: _balanceVisible,
                              onVisibilityToggle: () {
                                setState(() {
                                  _balanceVisible = !_balanceVisible;
                                });
                              },
                            ),
                            _AccountCard(
                              accountType: 'Fixed Deposit',
                              accountNumber: '456789123',
                              balance: '500,000.00',
                              currency: 'KES',
                              gradientColors: isDark
                                  ? [
                                      const Color(0xFF3A2A1A),
                                      const Color(0xFF201510),
                                    ]
                                  : [
                                      const Color(0xFFFFF5E5),
                                      const Color(0xFFFFF8F0),
                                    ],
                              cardDark: cardDark,
                              primary: const Color(0xFFFF9800),
                              balanceVisible: _balanceVisible,
                              onVisibilityToggle: () {
                                setState(() {
                                  _balanceVisible = !_balanceVisible;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Page Indicator
                    const SizedBox(height: 16),
                    _PageIndicator(count: 3, activeIndex: _currentPage),

                    const SizedBox(height: 24),

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
                            icon: Icons.send,
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
                            icon: Icons.receipt,
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
                            icon: Icons.phone_iphone,
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
                            icon: Icons.repeat,
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
            _NavButton(
              icon: Icons.miscellaneous_services,
              label: 'Services',
              active: false,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MenuServicesView(),
                  ),
                );
              },
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

// Account Card Widget for Carousel - Simplified for Swipe Navigation
class _AccountCard extends StatelessWidget {
  final String accountType;
  final String accountNumber;
  final String balance;
  final String currency;
  final List<Color> gradientColors;
  final Color cardDark;
  final Color primary;
  final bool balanceVisible;
  final VoidCallback onVisibilityToggle;

  const _AccountCard({
    required this.accountType,
    required this.accountNumber,
    required this.balance,
    required this.currency,
    required this.gradientColors,
    required this.cardDark,
    required this.primary,
    required this.balanceVisible,
    required this.onVisibilityToggle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        boxShadow: [
          BoxShadow(
            color: primary.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            right: -40,
            top: -40,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: primary.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: -20,
            bottom: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: primary.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.credit_card, color: primary, size: 12),
                          const SizedBox(width: 4),
                          Text(
                            accountType,
                            style: TextStyle(
                              fontFamily: AppTypography.fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.more_vert,
                      color: cardDark.withOpacity(0.5),
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Account Number',
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontWeight: AppTypography.medium,
                    fontSize: 9,
                    color: cardDark.withOpacity(0.6),
                  ),
                ),
                Text(
                  accountNumber,
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: cardDark,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      currency,
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: cardDark.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      balanceVisible ? balance : '••••••',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: cardDark,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        balanceVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: cardDark.withOpacity(0.4),
                        size: 18,
                      ),
                      onPressed: onVisibilityToggle,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Page Indicator Widget
class _PageIndicator extends StatelessWidget {
  final int count;
  final int activeIndex;

  const _PageIndicator({
    required this.count,
    required this.activeIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.primary;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == activeIndex ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: index == activeIndex ? primary : primary.withOpacity(0.3),
          ),
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
