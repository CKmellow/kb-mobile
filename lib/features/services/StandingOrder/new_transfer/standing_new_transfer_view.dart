import 'package:flutter/material.dart';

class StandingNewTransferView extends StatefulWidget {
  const StandingNewTransferView({Key? key}) : super(key: key);

  @override
  State<StandingNewTransferView> createState() =>
      _StandingNewTransferViewState();
}

class _StandingNewTransferViewState extends State<StandingNewTransferView> {
  final TextEditingController orderNameController = TextEditingController();
  final TextEditingController targetAccountController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController installmentsController = TextEditingController();
  final TextEditingController pin1 = TextEditingController();
  final TextEditingController pin2 = TextEditingController();
  final TextEditingController pin3 = TextEditingController();
  final TextEditingController pin4 = TextEditingController();
  String selectedSource = 'current';
  DateTime? firstRunDate;
  int executeEvery = 0; // 0: Month, 1: Week, 2: Day, 3: Year
  int whenToExecute = 0; // 0: Morning, 1: Afternoon, 2: Evening
  int insufficientFunds = 0;
  final List<String> sourceAccounts = [
    'Current Account (KES 124,500.00)',
    'Savings Account (KES 45,000.00)',
  ];
  final List<String> executeEveryOptions = ['Month', 'Week', 'Day', 'Year'];
  final List<String> insufficientFundsOptions = [
    'Skip payment for this period',
    'Retry for next 3 days',
    'Notify and wait for funds',
  ];

  @override
  void dispose() {
    orderNameController.dispose();
    targetAccountController.dispose();
    amountController.dispose();
    installmentsController.dispose();
    pin1.dispose();
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF102210)
          : const Color(0xFFF6F8F6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF102210).withOpacity(0.8)
                : Colors.white.withOpacity(0.8),
            border: Border(
              bottom: BorderSide(
                color: isDark
                    ? const Color(0xFF2a3d2a)
                    : const Color(0xFFdbe6db),
              ),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.01), blurRadius: 2),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: isDark ? Colors.white : const Color(0xFF111811),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Expanded(
                  child: Text(
                    'New Standing Order',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 48), // For symmetry
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 96),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section: Order Basics
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Order Name
                    _LabeledField(
                      label: 'Order Name',
                      child: TextField(
                        controller: orderNameController,
                        decoration: _inputDecoration(
                          context,
                          isDark,
                          'e.g. Monthly Rent',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Source Account
                    _LabeledField(
                      label: 'Source Account',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedSource,
                          items: [
                            DropdownMenuItem(
                              value: 'current',
                              child: Text(sourceAccounts[0]),
                            ),
                            DropdownMenuItem(
                              value: 'savings',
                              child: Text(sourceAccounts[1]),
                            ),
                          ],
                          onChanged: (v) =>
                              setState(() => selectedSource = v ?? 'current'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Target Account
                    _LabeledField(
                      label: 'Target Account',
                      child: TextField(
                        controller: targetAccountController,
                        decoration: _inputDecoration(
                          context,
                          isDark,
                          'Enter account number or name',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Amount
                    _LabeledField(
                      label: 'Amount (KES)',
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'KES',
                              style: TextStyle(
                                color: Color(0xFF618961),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              decoration:
                                  _inputDecoration(
                                    context,
                                    isDark,
                                    '0.00',
                                  ).copyWith(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 12,
                                    ),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Section: Schedule
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 0),
                child: Container(
                  color: isDark
                      ? const Color(0xFF1a2e1a).withOpacity(0.4)
                      : const Color(0xFFF6F8F6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Text(
                          'Schedule Payment',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      // First Run Date
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: _LabeledField(
                          label: 'First Run Date',
                          child: GestureDetector(
                            onTap: () async {
                              final picked = await showDatePicker(
                                context: context,
                                initialDate: firstRunDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 365),
                                ),
                              );
                              if (picked != null)
                                setState(() => firstRunDate = picked);
                            },
                            child: Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF1a2e1a)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isDark
                                      ? const Color(0xFF2a3d2a)
                                      : const Color(0xFFdbe6db),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    firstRunDate == null
                                        ? 'Select date'
                                        : '${firstRunDate!.year}-${firstRunDate!.month.toString().padLeft(2, '0')}-${firstRunDate!.day.toString().padLeft(2, '0')}',
                                    style: TextStyle(
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.calendar_month,
                                    color: Color(0xFF618961),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Execute Every & Installments
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: _LabeledField(
                                label: 'Execute Every',
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    value: executeEvery,
                                    items: List.generate(
                                      executeEveryOptions.length,
                                      (i) => DropdownMenuItem(
                                        value: i,
                                        child: Text(executeEveryOptions[i]),
                                      ),
                                    ),
                                    onChanged: (v) =>
                                        setState(() => executeEvery = v ?? 0),
                                    isExpanded: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _LabeledField(
                                label: 'Installments',
                                child: TextField(
                                  controller: installmentsController,
                                  keyboardType: TextInputType.number,
                                  decoration: _inputDecoration(
                                    context,
                                    isDark,
                                    '12',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // When to Execute
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'When to Execute',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: List.generate(3, (i) {
                                final selected = whenToExecute == i;
                                final labels = [
                                  'Morning',
                                  'Afternoon',
                                  'Evening',
                                ];
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2,
                                    ),
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: selected
                                            ? const Color(
                                                0xFF13ec13,
                                              ).withOpacity(0.1)
                                            : null,
                                        side: BorderSide(
                                          color: selected
                                              ? const Color(0xFF13ec13)
                                              : (isDark
                                                    ? Colors.white10
                                                    : Colors.grey.shade200),
                                          width: selected ? 2 : 1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      onPressed: () =>
                                          setState(() => whenToExecute = i),
                                      child: Text(
                                        labels[i],
                                        style: TextStyle(
                                          color: selected
                                              ? const Color(0xFF13ec13)
                                              : (isDark
                                                    ? Colors.white
                                                    : Colors.grey[600]),
                                          fontWeight: selected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Section: Logic & Security
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Advanced Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Insufficient Funds Logic
                    _LabeledField(
                      label: 'If There Is No Balance',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: insufficientFunds,
                          items: List.generate(
                            insufficientFundsOptions.length,
                            (i) => DropdownMenuItem(
                              value: i,
                              child: Text(insufficientFundsOptions[i]),
                            ),
                          ),
                          onChanged: (v) =>
                              setState(() => insufficientFunds = v ?? 0),
                          isExpanded: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Secure PIN
                    _LabeledField(
                      label: 'Confirm with Secure PIN',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _PinBox(controller: pin1),
                          const SizedBox(width: 8),
                          _PinBox(controller: pin2),
                          const SizedBox(width: 8),
                          _PinBox(controller: pin3),
                          const SizedBox(width: 8),
                          _PinBox(controller: pin4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF102210) : Colors.white,
          border: Border(
            top: BorderSide(
              color: isDark ? const Color(0xFF2a3d2a) : const Color(0xFFdbe6db),
            ),
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF13ec13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
            ),
            onPressed: () {},
            icon: const Icon(Icons.check_circle, color: Color(0xFF102210)),
            label: const Text(
              'Create Standing Order',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF102210),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label;
  final Widget child;
  const _LabeledField({required this.label, required this.child, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: isDark ? Colors.white : const Color(0xFF111811),
          ),
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}

InputDecoration _inputDecoration(
  BuildContext context,
  bool isDark,
  String hint,
) {
  return InputDecoration(
    hintText: hint,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: isDark ? const Color(0xFF2a3d2a) : const Color(0xFFdbe6db),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: isDark ? const Color(0xFF2a3d2a) : const Color(0xFFdbe6db),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF13ec13), width: 2),
    ),
    filled: true,
    fillColor: isDark ? const Color(0xFF1a2e1a) : Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
  );
}

class _PinBox extends StatelessWidget {
  final TextEditingController controller;
  const _PinBox({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: 48,
      child: TextField(
        controller: controller,
        obscureText: true,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: isDark ? const Color(0xFF1a2e1a) : Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: isDark ? const Color(0xFF2a3d2a) : const Color(0xFFdbe6db),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF13ec13), width: 2),
          ),
        ),
      ),
    );
  }
}
