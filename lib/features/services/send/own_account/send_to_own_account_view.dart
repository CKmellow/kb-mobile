import 'package:flutter/material.dart';
import '../../../../core/constants/typography.dart';
import '../../../../core/constants/colors.dart';

class SendToOwnAccountView extends StatelessWidget {
  const SendToOwnAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    final cardDark = const Color(0xFF111811);
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF102210) : Colors.white,
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
          'Transfer to Own Account',
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Move Money',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : cardDark,
                fontFamily: AppTypography.fontFamily,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Transfer funds instantly between your KB accounts.',
              style: TextStyle(
                fontSize: 14,
                color: isDark
                    ? primary.withOpacity(0.7)
                    : const Color(0xFF618961),
                fontFamily: AppTypography.fontFamily,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Source Account',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? primary.withOpacity(0.6)
                    : const Color(0xFF618961),
                fontFamily: AppTypography.fontFamily,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: isDark ? Colors.white10 : const Color(0xFFF6F8F6),
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
                  value: 'current',
                  child: Text('Current Account (***8921)'),
                ),
                DropdownMenuItem(
                  value: 'savings',
                  child: Text('Savings Account (***4412)'),
                ),
              ],
              onChanged: (v) {},
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Balance',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark
                        ? primary.withOpacity(0.5)
                        : const Color(0xFF618961),
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
                Text(
                  'KES 45,200.00',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : cardDark,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: isDark ? Colors.white : Colors.white,
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primary.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.swap_vert, color: cardDark),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Destination Account',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? primary.withOpacity(0.6)
                    : const Color(0xFF618961),
                fontFamily: AppTypography.fontFamily,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: isDark ? Colors.white10 : const Color(0xFFF6F8F6),
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
                  child: Text('Savings Account (***4412)'),
                ),
                DropdownMenuItem(
                  value: 'current',
                  child: Text('Current Account (***8921)'),
                ),
              ],
              onChanged: (v) {},
            ),
            const SizedBox(height: 24),
            Text(
              'Amount to Transfer',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? primary.withOpacity(0.6)
                    : const Color(0xFF618961),
                fontFamily: AppTypography.fontFamily,
              ),
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                Positioned(
                  left: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Text(
                      'KES',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? primary.withOpacity(0.7)
                            : const Color(0xFF618961),
                        fontSize: 18,
                        fontFamily: AppTypography.fontFamily,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '0.00',
                    contentPadding: const EdgeInsets.fromLTRB(56, 18, 16, 18),
                    filled: true,
                    fillColor: isDark ? Colors.white10 : Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(
                        color: isDark
                            ? Colors.white10
                            : const Color(0xFFDDE6DB),
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: isDark ? Colors.white : cardDark,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _AmountButton(label: '+ 1,000'),
                const SizedBox(width: 8),
                _AmountButton(label: '+ 5,000'),
                const SizedBox(width: 8),
                _AmountButton(label: 'Max Amount'),
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
                child: const Text('Transfer Now'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.verified_user,
                  size: 16,
                  color: isDark
                      ? primary.withOpacity(0.7)
                      : const Color(0xFF618961),
                ),
                const SizedBox(width: 4),
                Text(
                  'Zero transaction fees for own accounts',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark
                        ? primary.withOpacity(0.7)
                        : const Color(0xFF618961),
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AmountButton extends StatelessWidget {
  final String label;
  const _AmountButton({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isDark ? Colors.white10 : Colors.white,
        foregroundColor: primary,
        side: BorderSide(
          color: isDark ? Colors.white10 : const Color(0xFFDDE6DB),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}
