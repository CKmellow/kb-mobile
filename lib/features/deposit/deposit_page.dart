import 'package:flutter/material.dart';
import '../../core/constants/typography.dart';
import '../../core/constants/colors.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({Key? key}) : super(key: key);

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  bool _fromMyPhone = true;
  bool _toAccount = true;
  String? _selectedPhone;
  String? _otherPhone;
  String? _selectedAccount;
  String? _selectedCard;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardDark = const Color(0xFF111811);
    final primary = AppColors.primary;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF102210) : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      'Deposit Money',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: isDark ? Colors.white : cardDark,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                ],
              ),
            ),
            // Body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Deposit From
                      Text(
                        'Deposit From (M-PESA)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? primary.withOpacity(0.7)
                              : const Color(0xFF618961),
                          letterSpacing: 1.2,
                          fontFamily: AppTypography.fontFamily,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _RadioCard(
                            icon: Icons.smartphone,
                            label: 'My Phone',
                            selected: _fromMyPhone,
                            onTap: () {
                              setState(() {
                                _fromMyPhone = true;
                              });
                            },
                          ),
                          const SizedBox(width: 12),
                          _RadioCard(
                            icon: Icons.person_add,
                            label: 'Other Phone',
                            selected: !_fromMyPhone,
                            onTap: () {
                              setState(() {
                                _fromMyPhone = false;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _fromMyPhone
                          ? _DropdownField(
                              label: 'Select Phone Number',
                              items: const ['0712 345 456 (Default)'],
                              onChanged: (v) {
                                setState(() {
                                  _selectedPhone = v;
                                });
                              },
                            )
                          : TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Enter Phone Number',
                                filled: true,
                                fillColor: isDark
                                    ? Colors.white10
                                    : Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: isDark
                                        ? Colors.white10
                                        : const Color(0xFFDDE6DB),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: isDark
                                        ? Colors.white10
                                        : const Color(0xFFDDE6DB),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: primary),
                                ),
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: isDark ? Colors.white : cardDark,
                                fontFamily: AppTypography.fontFamily,
                              ),
                              onChanged: (v) {
                                setState(() {
                                  _otherPhone = v;
                                });
                              },
                            ),
                      const SizedBox(height: 24),
                      // Deposit To
                      Text(
                        'Deposit To',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? primary.withOpacity(0.7)
                              : const Color(0xFF618961),
                          letterSpacing: 1.2,
                          fontFamily: AppTypography.fontFamily,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _RadioCard(
                            icon: Icons.account_balance,
                            label: 'Account',
                            selected: _toAccount,
                            onTap: () {
                              setState(() {
                                _toAccount = true;
                              });
                            },
                          ),
                          const SizedBox(width: 12),
                          _RadioCard(
                            icon: Icons.credit_card,
                            label: 'Card',
                            selected: !_toAccount,
                            onTap: () {
                              setState(() {
                                _toAccount = false;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _toAccount
                          ? _DropdownField(
                              label: 'Select Account',
                              items: const [
                                'KB Savings - **** 8829',
                                'KB Current - **** 4410',
                              ],
                              onChanged: (v) {
                                setState(() {
                                  _selectedAccount = v;
                                });
                              },
                            )
                          : _DropdownField(
                              label: 'Select Card',
                              items: const [
                                'Visa - **** 1234',
                                'Mastercard - **** 5678',
                              ],
                              onChanged: (v) {
                                setState(() {
                                  _selectedCard = v;
                                });
                              },
                            ),
                      const SizedBox(height: 24),
                      // Amount
                      Text(
                        'Amount',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? primary.withOpacity(0.7)
                              : const Color(0xFF618961),
                          letterSpacing: 1.2,
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
                              contentPadding: const EdgeInsets.fromLTRB(
                                56,
                                18,
                                16,
                                18,
                              ),
                              filled: true,
                              fillColor: isDark ? Colors.white10 : Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: isDark
                                      ? Colors.white10
                                      : const Color(0xFFDDE6DB),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: isDark
                                      ? Colors.white10
                                      : const Color(0xFFDDE6DB),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: primary),
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Daily Limit Remaining: KES 150,000.00',
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark
                                ? primary.withOpacity(0.5)
                                : const Color(0xFF618961),
                            fontFamily: AppTypography.fontFamily,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Continue Button
            Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              color: isDark ? const Color(0xFF102210) : Colors.white,
              child: Column(
                children: [
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
                          Text('Continue'),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
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
    );
  }
}

class _RadioCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _RadioCard({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: selected
                ? primary.withOpacity(0.05)
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: selected
                    ? primary
                    : (isDark
                          ? primary.withOpacity(0.6)
                          : const Color(0xFF618961)),
                size: 28,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: selected
                      ? primary
                      : (isDark ? Colors.white : const Color(0xFF111811)),
                  fontFamily: AppTypography.fontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String label;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  const _DropdownField({
    required this.label,
    required this.items,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: isDark ? Colors.white10 : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: isDark ? Colors.white10 : const Color(0xFFDDE6DB),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: isDark ? Colors.white10 : const Color(0xFFDDE6DB),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.primary),
        ),
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(value: item, child: Text(item)),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
