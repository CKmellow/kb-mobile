import 'package:flutter/material.dart';
import '../../../core/constants/typography.dart';
import '../../../core/constants/colors.dart';
import '../pay/kenya_power/kenya_power_view.dart';
import '../pay/tv_payment/tv_payment_view.dart';
import '../pay/kra_payment/kra_payment_view.dart';
import '../pay/school_fees/school_fees_view.dart';
import '../send/pesalink/send_via_pesalink_view.dart';
import '../send/own_account/send_to_own_account_view.dart';
import '../send/send_money/send_money_view.dart';
import '../airtime/buy_airtime_view.dart';
import '../StandingOrder/home/standing_order_home_view.dart';

class MenuServicesView extends StatelessWidget {
  const MenuServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    final cardDark = const Color(0xFF111811);

    // Pay Category Actions
    final payActions = [
      {
        'icon': Icons.flash_on,
        'label': 'KPLC Tokens',
        'onTap': () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const KenyaPowerView()));
        },
      },
      {
        'icon': Icons.receipt_long,
        'label': 'KPLC Postpaid',
        'onTap': () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const KenyaPowerView()));
        },
      },
      {
        'icon': Icons.tv,
        'label': 'TV',
        'onTap': () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const TvPaymentView()));
        },
      },
      {
        'icon': Icons.account_balance,
        'label': 'KRA Payments',
        'onTap': () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const KrapaymentView()));
        },
      },
      {
        'icon': Icons.school,
        'label': 'School Fees',
        'onTap': () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const SchoolFeesView()));
        },
      },
    ];

    // Send Category Actions
    final sendActions = [
      {
        'icon': Icons.phone_android,
        'label': 'Send to M-Pesa',
        'onTap': () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const SendMoneyView()));
        },
      },
      {
        'icon': Icons.account_balance,
        'label': 'Send via PesaLink',
        'onTap': () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const SendViaPesaLinkView()),
          );
        },
      },
      {
        'icon': Icons.account_balance_wallet,
        'label': 'Send to Own Account',
        'onTap': () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const SendToOwnAccountView()),
          );
        },
      },
    ];

    // Others Category Actions
    final othersActions = [
      {
        'icon': Icons.phone_iphone,
        'label': 'Buy Airtime',
        'onTap': () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const BuyAirtimeView()));
        },
      },
      {
        'icon': Icons.schedule,
        'label': 'Standing Orders',
        'onTap': () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const StandingOrderHomeView()),
          );
        },
      },
    ];

    return Scaffold(
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
                        'Services',
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
                      const SizedBox(height: 24),

                      // Pay Category
                      _buildCategorySection(
                        context: context,
                        title: 'Pay',
                        actions: payActions,
                        isDark: isDark,
                        primary: primary,
                        cardDark: cardDark,
                      ),

                      const SizedBox(height: 32),

                      // Send Category
                      _buildCategorySection(
                        context: context,
                        title: 'Send',
                        actions: sendActions,
                        isDark: isDark,
                        primary: primary,
                        cardDark: cardDark,
                      ),

                      const SizedBox(height: 32),

                      // Others Category
                      _buildCategorySection(
                        context: context,
                        title: 'Others',
                        actions: othersActions,
                        isDark: isDark,
                        primary: primary,
                        cardDark: cardDark,
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

  Widget _buildCategorySection({
    required BuildContext context,
    required String title,
    required List<Map<String, dynamic>> actions,
    required bool isDark,
    required Color primary,
    required Color cardDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
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
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.2,
            children: actions.map((action) {
              return Material(
                color: isDark ? Colors.white10 : Colors.white,
                borderRadius: BorderRadius.circular(24),
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: action['onTap'] as VoidCallback,
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
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Icon(
                            action['icon'] as IconData,
                            color: primary,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          action['label'] as String,
                          style: TextStyle(
                            color: isDark ? Colors.white : cardDark,
                            fontFamily: AppTypography.fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
