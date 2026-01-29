import 'package:flutter/material.dart';
import '../../../../core/constants/typography.dart';
import '../../../../core/constants/colors.dart';

class SendViaPesaLinkView extends StatelessWidget {
  const SendViaPesaLinkView({Key? key}) : super(key: key);

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
          'Send via PesaLink',
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
              'Recipient Bank',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
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
                fillColor: isDark ? Colors.white10 : const Color(0xFFF0F4F0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),
              ),
              items: const [
                DropdownMenuItem(value: '', child: Text('Select Bank')),
                DropdownMenuItem(value: 'kcb', child: Text('KCB Bank')),
                DropdownMenuItem(value: 'equity', child: Text('Equity Bank')),
                DropdownMenuItem(value: 'abs', child: Text('Absa Bank')),
                DropdownMenuItem(
                  value: 'stanchart',
                  child: Text('Standard Chartered'),
                ),
                DropdownMenuItem(
                  value: 'coop',
                  child: Text('Co-operative Bank'),
                ),
              ],
              onChanged: (v) {},
            ),
            const SizedBox(height: 20),
            Text(
              'Account Number',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? primary.withOpacity(0.7)
                    : const Color(0xFF618961),
                fontFamily: AppTypography.fontFamily,
              ),
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter account number',
                    filled: true,
                    fillColor: isDark
                        ? Colors.white10
                        : const Color(0xFFF0F4F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isDark ? Colors.white : cardDark,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Icon(Icons.person_search, color: primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  margin: const EdgeInsets.only(right: 8),
                ),
                Text(
                  'Searching for: John Doe',
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: isDark
                        ? primary.withOpacity(0.7)
                        : const Color(0xFF618961),
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Amount',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? primary.withOpacity(0.7)
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
                        color: isDark ? Colors.white : cardDark,
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
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Balance: KES 45,230.00',
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark
                        ? primary.withOpacity(0.7)
                        : const Color(0xFF618961),
                    fontWeight: FontWeight.bold,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _AmountButton(label: '+ 1,000'),
                const SizedBox(width: 8),
                _AmountButton(label: '+ 5,000'),
                const SizedBox(width: 8),
                _AmountButton(label: '+ 10,000'),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primary.withOpacity(0.05),
                border: Border.all(color: primary.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.info, color: primary, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PesaLink Transfer',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: isDark ? Colors.white : cardDark,
                            fontFamily: AppTypography.fontFamily,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Transfers via PesaLink are instant and available 24/7 across all local banks.',
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
                  ),
                ],
              ),
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
                    Text('Send Money'),
                    SizedBox(width: 8),
                    Icon(Icons.trending_flat),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
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
