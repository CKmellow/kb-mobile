import 'package:flutter/material.dart';
import '../../../core/constants/typography.dart';
import '../../../core/constants/colors.dart';

class BuyAirtimeView extends StatelessWidget {
  const BuyAirtimeView({Key? key}) : super(key: key);

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
          'Buy Airtime',
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
                'Select Account',
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
                    value: 'savings',
                    child: Text('Savings Account - **** 4829 (KES 45,200.00)'),
                  ),
                  DropdownMenuItem(
                    value: 'current',
                    child: Text('Current Account - **** 9102 (KES 12,850.50)'),
                  ),
                  DropdownMenuItem(
                    value: 'fixed',
                    child: Text('Fixed Deposit - **** 3321 (KES 150,000.00)'),
                  ),
                ],
                onChanged: (v) {},
              ),
              const SizedBox(height: 20),
              Text(
                'Recipient Number',
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
                  hintText: 'Enter mobile number',
                  prefixIcon: Icon(Icons.phone_iphone, color: Colors.grey),
                  suffixIcon: Icon(Icons.contact_page, color: primary),
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
              const SizedBox(height: 8),
              Row(
                children: [
                  _ContactChip(label: 'Mom'),
                  const SizedBox(width: 8),
                  _ContactChip(label: 'John Smith'),
                  const SizedBox(width: 8),
                  _ContactChip(label: 'Office'),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Amount (KES)',
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
              const SizedBox(height: 8),
              Row(
                children: [
                  _AmountButton(label: '50'),
                  const SizedBox(width: 8),
                  _AmountButton(label: '100'),
                  const SizedBox(width: 8),
                  _AmountButton(label: '500'),
                  const SizedBox(width: 8),
                  _AmountButton(label: '1000'),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Recent Purchases',
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
              _RecentPurchaseTile(),
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
                  child: const Text('Purchase Airtime'),
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

class _ContactChip extends StatelessWidget {
  final String label;
  const _ContactChip({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isDark ? Colors.white10 : Colors.white,
        foregroundColor: AppColors.primary,
        side: BorderSide(
          color: isDark ? Colors.white10 : const Color(0xFFDDE6DB),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}

class _AmountButton extends StatelessWidget {
  final String label;
  const _AmountButton({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isDark ? Colors.white10 : Colors.white,
        foregroundColor: AppColors.primary,
        side: BorderSide(
          color: isDark ? Colors.white10 : const Color(0xFFDDE6DB),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}

class _RecentPurchaseTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white10 : Colors.white,
        border: Border.all(
          color: isDark ? Colors.white10 : const Color(0xFFDDE6DB),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.person, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '0712 *** 890',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'KES 200 • 2 days ago',
                    style: TextStyle(fontSize: 12, color: Color(0xFF618961)),
                  ),
                ],
              ),
            ],
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.primary.withOpacity(0.1),
              foregroundColor: AppColors.primary,
              side: BorderSide(color: Colors.transparent),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            onPressed: () {},
            child: const Text('Repeat'),
          ),
        ],
      ),
    );
  }
}
