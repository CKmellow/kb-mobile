import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/typography.dart';
import '../../confirmation/confirm_transfer_view.dart';

class SendMoneyView extends StatefulWidget {
  const SendMoneyView({Key? key}) : super(key: key);

  @override
  State<SendMoneyView> createState() => _SendMoneyViewState();
}

class _SendMoneyViewState extends State<SendMoneyView> {
  int selectedRecipient = 0; // 0: My Number, 1: Other Number
  int? quickAmount;
  String? selectedAccount = 'Main Account (**** 8976) - KES 145,200.50';
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<String> accounts = [
    'Main Account (**** 8976) - KES 145,200.50',
    'Savings Vault (**** 1243) - KES 42,000.00',
  ];

  final List<int> quickAmounts = [500, 1000, 5000];

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = AppColors.primary;
    final cardDark = const Color(0xFF111811);
    final bgLight = const Color(0xFFF6F8F6);
    final bgDark = const Color(0xFF102210);

    return Scaffold(
      backgroundColor: isDark ? bgDark : bgLight,
      appBar: AppBar(
        backgroundColor: isDark
            ? bgDark.withOpacity(0.8)
            : bgLight.withOpacity(0.8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: isDark ? Colors.white : cardDark,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Send Money',
          style: TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontWeight: AppTypography.bold,
            color: isDark ? Colors.white : cardDark,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            color: isDark ? Colors.white : cardDark,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipient Type
              Row(
                children: [
                  _RecipientButton(
                    icon: Icons.person,
                    label: 'To My Number',
                    selected: selectedRecipient == 0,
                    onTap: () => setState(() => selectedRecipient = 0),
                    primary: primary,
                  ),
                  const SizedBox(width: 12),
                  _RecipientButton(
                    icon: Icons.group,
                    label: 'Other Number',
                    selected: selectedRecipient == 1,
                    onTap: () => setState(() => selectedRecipient = 1),
                    primary: primary,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Source Account
              Text(
                'Source Account',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isDark ? Colors.grey[400] : Colors.grey[500],
                  letterSpacing: 1.2,
                  shadows: [
                    Shadow(color: Colors.transparent, offset: Offset(0, 0)),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark ? Colors.grey[800]! : const Color(0xFFE5E7EB),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedAccount,
                    isExpanded: true,
                    icon: Icon(Icons.unfold_more, color: Colors.grey[400]),
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: isDark ? Colors.white : cardDark,
                    ),
                    dropdownColor: isDark ? Colors.grey[900] : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    onChanged: (value) =>
                        setState(() => selectedAccount = value),
                    items: accounts
                        .map(
                          (acc) =>
                              DropdownMenuItem(value: acc, child: Text(acc)),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Amount
              Text(
                'Amount',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isDark ? Colors.grey[400] : Colors.grey[500],
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 6),
              Stack(
                children: [
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: TextStyle(
                      fontFamily: AppTypography.fontFamily,
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                      color: isDark ? Colors.white : cardDark,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: isDark ? Colors.grey[900] : Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: isDark
                              ? Colors.grey[800]!
                              : const Color(0xFFE5E7EB),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),
                      hintText: '0.00',
                      hintStyle: TextStyle(
                        color: isDark ? Colors.grey[700] : Colors.grey[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 8),
                        child: Text(
                          'KES',
                          style: TextStyle(
                            fontFamily: AppTypography.fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Quick Amounts
              Wrap(
                spacing: 8,
                children: quickAmounts
                    .map(
                      (amt) => ChoiceChip(
                        label: Text('KES ${amt.toString()}'),
                        selected: quickAmount == amt,
                        onSelected: (selected) {
                          setState(() {
                            quickAmount = selected ? amt : null;
                            if (selected) {
                              amountController.text = amt.toString();
                            }
                          });
                        },
                        selectedColor: primary.withOpacity(0.15),
                        backgroundColor: isDark
                            ? Colors.grey[800]
                            : Colors.grey[100],
                        labelStyle: TextStyle(
                          fontFamily: AppTypography.fontFamily,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                          side: BorderSide(
                            color: quickAmount == amt
                                ? primary
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              // Description
              Text(
                'Description (Optional)',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isDark ? Colors.grey[400] : Colors.grey[500],
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                minLines: 2,
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: isDark ? Colors.white : cardDark,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isDark ? Colors.grey[900] : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: isDark
                          ? Colors.grey[800]!
                          : const Color(0xFFE5E7EB),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  hintText: 'What\'s this for?',
                  hintStyle: TextStyle(
                    color: isDark ? Colors.grey[700] : Colors.grey[400],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: isDark ? bgDark.withOpacity(0.95) : bgLight.withOpacity(0.95),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ConfirmTransferView(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: cardDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Continue'),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 64,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[700] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecipientButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color primary;
  const _RecipientButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.primary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: selected
                ? primary.withOpacity(0.10)
                : (isDark ? Colors.grey[900] : Colors.white),
            border: Border.all(
              color: selected
                  ? primary
                  : (isDark ? Colors.grey[800]! : const Color(0xFFE5E7EB)),
              width: selected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: selected
                      ? primary.withOpacity(0.20)
                      : (isDark ? Colors.grey[800] : const Color(0xFFF3F4F6)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: selected
                      ? primary
                      : (isDark ? Colors.white : Colors.black),
                  size: 32,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: selected
                      ? primary
                      : (isDark ? Colors.white : Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
