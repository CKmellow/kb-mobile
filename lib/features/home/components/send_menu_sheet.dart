import 'package:flutter/material.dart';
import '../../../core/constants/typography.dart';
import '../../../core/constants/colors.dart';
import '../../services/send/send_money/send_money_view.dart';
import '../../services/send/pesalink/send_via_pesalink_view.dart';
import '../../services/send/own_account/send_to_own_account_view.dart';

class SendMenuSheet extends StatelessWidget {
  const SendMenuSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    final cardDark = const Color(0xFF111811);
    final items = [
      _SendPayGridItem(
        icon: Icons.phone_android,
        label: 'Send to M-Pesa',
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SendMoneyView()),
          );
        },
      ),
      _SendPayGridItem(
        icon: Icons.account_balance,
        label: 'Send via PesaLink',
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SendViaPesaLinkView(),
            ),
          );
        },
      ),
      _SendPayGridItem(
        icon: Icons.account_balance_wallet,
        label: 'Send to Own Account',
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SendToOwnAccountView(),
            ),
          );
        },
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send',
            style: TextStyle(
              fontFamily: AppTypography.fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: isDark ? Colors.white : cardDark,
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: items
                .map((item) => _SendPayGridButton(item: item, isDark: isDark))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SendPayGridItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  _SendPayGridItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

class _SendPayGridButton extends StatelessWidget {
  final _SendPayGridItem item;
  final bool isDark;
  const _SendPayGridButton({required this.item, required this.isDark, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.primary;
    return Material(
      color: isDark ? Colors.grey[900] : Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: item.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: isDark ? Colors.grey[800]! : const Color(0xFFE5E7EB),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  item.icon,
                  color: isDark ? Colors.white : primary,
                  size: 28,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: isDark ? Colors.white : const Color(0xFF111811),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
