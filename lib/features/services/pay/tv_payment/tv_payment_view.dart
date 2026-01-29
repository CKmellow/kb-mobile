import 'package:flutter/material.dart';
import '../../../../core/constants/typography.dart';
import '../../../../core/constants/colors.dart';

class TvPaymentView extends StatelessWidget {
  const TvPaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    final cardDark = const Color(0xFF111811);
    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF102210)
          : const Color(0xFFF6F8F6),
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF102210) : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : cardDark,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'TV Payment',
          style: TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: isDark ? Colors.white : cardDark,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pay From',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isDark
                      ? primary.withOpacity(0.7)
                      : const Color(0xFF618961),
                  fontFamily: AppTypography.fontFamily,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isDark ? Colors.white10 : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: isDark ? Colors.white10 : const Color(0xFFDDE6DB),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'acc-1',
                    child: Text('Personal Account - *4829 (KES 45,200.00)'),
                  ),
                  DropdownMenuItem(
                    value: 'acc-2',
                    child: Text('Savings Account - *1102 (KES 12,500.00)'),
                  ),
                  DropdownMenuItem(
                    value: 'acc-3',
                    child: Text('Business Account - *9934 (KES 210,000.00)'),
                  ),
                ],
                onChanged: (v) {},
              ),
              const SizedBox(height: 20),
              Text(
                'Select Provider',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isDark
                      ? primary.withOpacity(0.7)
                      : const Color(0xFF618961),
                  fontFamily: AppTypography.fontFamily,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _ProviderTile(label: 'DSTV', selected: true, isDark: isDark),
                  const SizedBox(width: 8),
                  _ProviderTile(label: 'Zuku', selected: false, isDark: isDark),
                  const SizedBox(width: 8),
                  _ProviderTile(label: 'GOtv', selected: false, isDark: isDark),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Smartcard / Account Number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isDark
                      ? primary.withOpacity(0.7)
                      : const Color(0xFF618961),
                  fontFamily: AppTypography.fontFamily,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter account number',
                  filled: true,
                  fillColor: isDark ? Colors.white10 : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: isDark ? Colors.white10 : const Color(0xFFDDE6DB),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Amount',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isDark
                      ? primary.withOpacity(0.7)
                      : const Color(0xFF618961),
                  fontFamily: AppTypography.fontFamily,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.00',
                  prefixText: 'KES ',
                  filled: true,
                  fillColor: isDark ? Colors.white10 : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: isDark ? Colors.white10 : const Color(0xFFDDE6DB),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (v) {}),
                  const SizedBox(width: 8),
                  Text(
                    'Save as frequent biller',
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? Colors.white : cardDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Continue to Payment'),
                      SizedBox(width: 8),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProviderTile extends StatelessWidget {
  final String label;
  final bool selected;
  final bool isDark;
  const _ProviderTile({
    required this.label,
    required this.selected,
    required this.isDark,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.primary;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selected
              ? primary.withOpacity(0.1)
              : (isDark ? Colors.white10 : Colors.white),
          border: Border.all(
            color: selected
                ? primary
                : (isDark ? Colors.white10 : const Color(0xFFDDE6DB)),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(
              Icons.tv,
              color: selected
                  ? primary
                  : (isDark ? Colors.white54 : Colors.grey),
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: selected
                    ? primary
                    : (isDark ? Colors.white : const Color(0xFF111811)),
                fontFamily: AppTypography.fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
