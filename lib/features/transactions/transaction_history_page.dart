import 'package:flutter/material.dart';
import '../../core/constants/typography.dart';
import '../../core/constants/colors.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardDark = const Color(0xFF111811);
    final primary = AppColors.primary;
    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF102210)
          : const Color(0xFFF6F8F6),
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF102210).withOpacity(0.8)
                    : Colors.white.withOpacity(0.8),
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? Colors.white10 : const Color(0xFFF3F4F6),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: isDark ? Colors.white : cardDark,
                      ),
                    ),
                  ),
                  Text(
                    'Transactions History',
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: isDark ? Colors.white : cardDark,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.search,
                        color: isDark ? Colors.white : cardDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Filter Chips
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _FilterChip(
                      label: 'All Time',
                      selected: true,
                      onTap: () {},
                    ),
                    _FilterChip(label: 'This Month', onTap: () {}),
                    _FilterChip(label: 'Last 30 Days', onTap: () {}),
                    _FilterChip(label: 'Custom Range', onTap: () {}),
                  ],
                ),
              ),
            ),
            // Transactions List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 80),
                children: [
                  _SectionHeader('Today, Oct 24'),
                  _TransactionCard(
                    icon: Icons.shopping_bag,
                    iconBg: primary.withOpacity(0.1),
                    iconColor: primary,
                    title: 'Naivas Supermarket',
                    subtitle: 'Payment • 02:45 PM',
                    amount: '- KES 2,450.00',
                    amountColor: cardDark,
                    type: 'Debit',
                  ),
                  _TransactionCard(
                    icon: Icons.payments,
                    iconBg: Colors.green[100],
                    iconColor: Colors.green[600],
                    title: 'Salary Credit',
                    subtitle: 'Deposit • 09:00 AM',
                    amount: '+ KES 85,000.00',
                    amountColor: Colors.green[600],
                    type: 'Credit',
                  ),
                  _SectionHeader('Yesterday, Oct 23'),
                  _TransactionCard(
                    icon: Icons.send,
                    iconBg: primary.withOpacity(0.1),
                    iconColor: primary,
                    title: 'Transfer to John Doe',
                    subtitle: 'M-Pesa Transfer • 06:12 PM',
                    amount: '- KES 5,015.00',
                    amountColor: cardDark,
                    type: 'Debit',
                  ),
                  _TransactionCard(
                    icon: Icons.bolt,
                    iconBg: Colors.blue[100],
                    iconColor: Colors.blue[600],
                    title: 'KPLC Token',
                    subtitle: 'Utility • 10:30 AM',
                    amount: '- KES 1,000.00',
                    amountColor: cardDark,
                    type: 'Debit',
                  ),
                  _SectionHeader('Oct 21'),
                  _TransactionCard(
                    icon: Icons.restaurant,
                    iconBg: primary.withOpacity(0.1),
                    iconColor: primary,
                    title: 'Java House CBD',
                    subtitle: 'Dining • 01:15 PM',
                    amount: '- KES 1,200.00',
                    amountColor: cardDark,
                    type: 'Debit',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        foregroundColor: cardDark,
        onPressed: () {},
        child: const Icon(Icons.download),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _FilterChip({
    required this.label,
    this.selected = false,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: selected
                ? primary
                : (isDark ? Colors.white10 : Colors.white),
            borderRadius: BorderRadius.circular(24),
            border: selected
                ? null
                : Border.all(
                    color: isDark ? Colors.white10 : const Color(0xFFE5E7EB),
                  ),
            boxShadow: selected
                ? [BoxShadow(color: primary.withOpacity(0.15), blurRadius: 8)]
                : null,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected
                  ? const Color(0xFF111811)
                  : (isDark
                        ? primary.withOpacity(0.7)
                        : const Color(0xFF618961)),
              fontWeight: selected ? FontWeight.bold : FontWeight.w600,
              fontSize: 12,
              fontFamily: AppTypography.fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        label,
        style: TextStyle(
          color: isDark ? primary.withOpacity(0.6) : const Color(0xFF618961),
          fontWeight: FontWeight.bold,
          fontSize: 12,
          letterSpacing: 1.2,
          fontFamily: AppTypography.fontFamily,
        ),
      ),
    );
  }
}

class _TransactionCard extends StatelessWidget {
  final IconData icon;
  final Color? iconBg;
  final Color? iconColor;
  final String title;
  final String subtitle;
  final String amount;
  final Color? amountColor;
  final String type;
  const _TransactionCard({
    required this.icon,
    this.iconBg,
    this.iconColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.amountColor,
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white10 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white10 : const Color(0xFFE5E7EB),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color:
                  iconBg ??
                  (isDark ? Colors.white10 : primary.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(icon, color: iconColor ?? primary, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: isDark ? Colors.white : const Color(0xFF111811),
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark
                        ? primary.withOpacity(0.6)
                        : const Color(0xFF618961),
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color:
                      amountColor ??
                      (isDark ? Colors.white : const Color(0xFF111811)),
                  fontFamily: AppTypography.fontFamily,
                ),
              ),
              Text(
                type.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  color: isDark
                      ? primary.withOpacity(0.6)
                      : const Color(0xFF618961),
                  fontWeight: FontWeight.w600,
                  fontFamily: AppTypography.fontFamily,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
