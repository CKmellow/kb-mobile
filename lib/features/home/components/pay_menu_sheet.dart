import 'package:flutter/material.dart';

import '../../../core/constants/typography.dart';
import '../../../core/constants/colors.dart';
import '../../payments/pay/kenya_power/kenya_power_view.dart';
import '../../payments/pay/tv_payment/tv_payment_view.dart';
import '../../payments/pay/kra_payment/kra_payment_view.dart';
import '../../payments/pay/school_fees/school_fees_view.dart';

class PayBillsPage extends StatelessWidget {
  const PayBillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardDark = const Color(0xFF111811);
    final primary = AppColors.primary;
    final categories = [
      {
        'icon': Icons.flash_on,
        'label': 'KPLC Tokens',
        'onTap': (BuildContext context) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const KenyaPowerView()));
        },
      },
      {
        'icon': Icons.receipt_long,
        'label': 'KPLC Postpaid',
        'onTap': (BuildContext context) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const KenyaPowerView()));
        },
      },
      {
        'icon': Icons.water_drop,
        'label': 'Nairobi Water',
        'onTap': (BuildContext context) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const KenyaPowerView()));
        },
      },
      {
        'icon': Icons.tv,
        'label': 'TV',
        'onTap': (BuildContext context) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const TvPaymentView()));
        },
      },
      {
        'icon': Icons.account_balance,
        'label': 'KRA Payments',
        'onTap': (BuildContext context) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const KrapaymentView()));
        },
      },
      // {
      //   'icon': Icons.language,
      //   'label': 'eCitizen',
      //   'onTap': (BuildContext context) {
      //     // TODO: Implement eCitizen page
      //   },
      // },
      {
        'icon': Icons.school,
        'label': 'School Fees',
        'onTap': (BuildContext context) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const SchoolFeesView()));
        },
      },
      // {
      //   'icon': Icons.church,
      //   'label': 'Church',
      //   'onTap': (BuildContext context) {
      //     // TODO: Implement Church page
      //   },
      // },
    ];
    final frequentBillers = [
      {
        'icon': Icons.water_drop,
        'title': 'Nairobi Water',
        'subtitle': 'A/C: 49202120',
      },
      {
        'icon': Icons.flash_on,
        'title': 'Kenya Power Pre-paid',
        'subtitle': 'Meter: 371900223',
      },
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: isDark
          ? const Color(0xFF102210)
          : const Color(0xFFF6F8F6),
      body: SafeArea(
        top: true,
        bottom: false,
        child: SizedBox.expand(
          child: Column(
            children: [
              // AppBar
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF102210) : Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: isDark ? Colors.white10 : const Color(0xFFF3F4F6),
                    ),
                  ),
                ),
                child: Row(
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
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Pay Bills',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: isDark ? Colors.white : cardDark,
                        ),
                      ),
                    ),
                    const SizedBox(width: 32), // Placeholder for symmetry
                  ],
                ),
              ),
              // Body
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Bar
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[400],
                            ),
                            hintText: 'Search for a biller...',
                            filled: true,
                            fillColor: isDark ? Colors.white10 : Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: isDark
                                    ? Colors.white10
                                    : const Color(0xFFE5E7EB),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: isDark
                                    ? Colors.white10
                                    : const Color(0xFFE5E7EB),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: primary),
                            ),
                          ),
                          style: TextStyle(
                            color: isDark ? Colors.white : cardDark,
                            fontFamily: AppTypography.fontFamily,
                          ),
                        ),
                      ),
                      // Categories
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            color: isDark
                                ? primary.withOpacity(0.7)
                                : const Color(0xFF618961),
                            fontFamily: AppTypography.fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            letterSpacing: 1.2,
                            // uppercase
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                        child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1.2,
                          children: categories.map((cat) {
                            return Material(
                              color: isDark ? Colors.white10 : Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(24),
                                onTap: () =>
                                    (cat['onTap']
                                        as void Function(BuildContext))(
                                      context,
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 8,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: primary.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                        ),
                                        child: Icon(
                                          cat['icon'] as IconData,
                                          color: primary,
                                          size: 32,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        cat['label'] as String,
                                        style: TextStyle(
                                          color: isDark
                                              ? Colors.white
                                              : cardDark,
                                          fontFamily: AppTypography.fontFamily,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      // Frequent Billers
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Frequent Billers',
                              style: TextStyle(
                                color: isDark
                                    ? primary.withOpacity(0.7)
                                    : const Color(0xFF618961),
                                fontFamily: AppTypography.fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                letterSpacing: 1.2,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: AppTypography.fontFamily,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: frequentBillers.map((biller) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isDark ? Colors.white10 : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isDark
                                      ? Colors.white10
                                      : const Color(0xFFE5E7EB),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? Colors.white10
                                          : const Color(0xFFF6F8F6),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      biller['icon'] as IconData,
                                      color: isDark
                                          ? Colors.grey[400]
                                          : Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          biller['title'] as String,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: isDark
                                                ? Colors.white
                                                : cardDark,
                                            fontFamily:
                                                AppTypography.fontFamily,
                                          ),
                                        ),
                                        Text(
                                          biller['subtitle'] as String,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: isDark
                                                ? primary.withOpacity(0.6)
                                                : const Color(0xFF618961),
                                            fontFamily:
                                                AppTypography.fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.grey[400],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              // Add New Biller Button
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                color: isDark ? const Color(0xFF102210) : Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          foregroundColor: cardDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: TextStyle(
                            fontFamily: AppTypography.fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text(
                          'Add New Biller',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
