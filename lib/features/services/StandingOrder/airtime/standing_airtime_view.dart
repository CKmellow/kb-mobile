import 'package:flutter/material.dart';

class StandingAirtimeView extends StatefulWidget {
  const StandingAirtimeView({Key? key}) : super(key: key);

  @override
  State<StandingAirtimeView> createState() => _StandingAirtimeViewState();
}

class _StandingAirtimeViewState extends State<StandingAirtimeView> {
  int selectedProvider = 0;
  final List<Map<String, String>> providers = [
    {
      'name': 'Safaricom',
      'img':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuD4MlTLjMxZXCnh0U6l6KIrY04d0wVqnPQ0iUOc4zIkleQ700kyCaapFnFy0mrwW7sUpCpDjP1okCwx2vH6H8GTxkIOrYyYrEsWPGdZ_O31DJBUsePioaJwMwAMZsdnbkUwMjMLdwGOfGlt6liaiJ1sDHh_YLu1aKl1zdSyQMed8SfzJL60wRUxPg5Esude8reYSax4ftOTlyRkrNWlLnyFJVJwaXDtrnBZf74XYj2JlaRYw3L5ABIJ3GBTVYGS7RGgqX3ntgDjj03q',
    },
    {
      'name': 'Airtel',
      'img':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAm3lcAcR2H2GMrvuKWUMAN93mak6oKBuKArSc5dQG0I_5wHFMof6hxEjCfqMX66tDYHZHILRE_MwHnCqSIjnvuKJ7ZD3NKFpIbJ1k8MGbjpAA9X-kDUlwV3DyEc8aeinlRJApJ2RW7li2NQRZm9GEtBSzp9Y5jZZ7-etsO3gM3hHIusEIqOXof84xMt5XDNv0is06Yrhb1xKtyG_RqIPKL7ucahbC6Ibmqzw5HKyaLKWpgGE1Em3uwyXouhlidpCd_ox0NiDH2dgRp',
    },
    {
      'name': 'Telkom',
      'img':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBSTagzoz9oSbbgqqVHKJJ_YxMNqlZ8_0mBoMKYgNaVMv8iR2Va2YzIGxfnWeqE1LF50lZKxQwPk-wj1UxJiF3XBno6qQQJg6ug-_OHoucc03ZGfQiGkL25TtJ9ShS3eaIIu7Qn1_b-eZo5Jr-CG1-Z6AvMq5MDsC4QtihHCt4K_7V6FkFT9GUBAASM-0iJkgtQ6zb3IewP1Looqn8cfPA-E4rMs-XAtXDoGOGltzZ04x43VOaMDrnZKVeLrpwd5bURxkF3JCj1mNTP',
    },
  ];

  int selectedFrequency = 0;
  final List<String> frequencies = ['Daily', 'Weekly', 'Monthly'];

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController pin1 = TextEditingController();
  final TextEditingController pin2 = TextEditingController();
  final TextEditingController pin3 = TextEditingController();
  final TextEditingController pin4 = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    amountController.dispose();
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
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF102210) : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: isDark ? Colors.white : const Color(0xFF111811),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'New Standing Order',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SectionHeader: Provider
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Select Provider',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Choose your mobile network',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            // ImageGrid: Network Providers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(providers.length, (i) {
                  final selected = selectedProvider == i;
                  return GestureDetector(
                    onTap: () => setState(() => selectedProvider = i),
                    child: Stack(
                      children: [
                        Container(
                          width: 90,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selected
                                ? const Color(0xFF13ec13).withOpacity(0.05)
                                : (isDark
                                      ? const Color(0xFF152a15)
                                      : Colors.white),
                            border: Border.all(
                              color: selected
                                  ? const Color(0xFF13ec13)
                                  : (isDark
                                        ? Colors.white10
                                        : Colors.grey.shade200),
                              width: selected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  providers[i]['img']!,
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                providers[i]['name']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: isDark
                                      ? Colors.white
                                      : const Color(0xFF111811),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (selected)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF13ec13),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(2),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            // Recipient Details
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Source Account',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.white10 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDark ? Colors.white10 : Colors.grey.shade200,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: 'kb_salary',
                        items: const [
                          DropdownMenuItem(
                            value: 'kb_salary',
                            child: Text(
                              'Salary Account - ...8829 (Ksh 142,500)',
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'kb_savings',
                            child: Text(
                              'Savings Account - ...4410 (Ksh 12,000)',
                            ),
                          ),
                        ],
                        onChanged: (_) {},
                        isExpanded: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Phone Number',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: '07XX XXX XXX',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: isDark
                                    ? Colors.white10
                                    : Colors.grey.shade200,
                              ),
                            ),
                            filled: true,
                            fillColor: isDark ? Colors.white10 : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF13ec13).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.contact_page,
                          color: Color(0xFF13ec13),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Amount (Ksh)',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Min 10 - Max 10,000',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: isDark ? Colors.white10 : Colors.grey.shade200,
                        ),
                      ),
                      filled: true,
                      fillColor: isDark ? Colors.white10 : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Scheduling Section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Payment Schedule',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Frequency',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(frequencies.length, (i) {
                      final selected = selectedFrequency == i;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: selected
                                  ? const Color(0xFF13ec13).withOpacity(0.1)
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
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: () =>
                                setState(() => selectedFrequency = i),
                            child: Text(
                              frequencies[i],
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
                  const SizedBox(height: 16),
                  const Text(
                    'Execution Time',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.white10 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDark ? Colors.white10 : Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            '08:00 AM',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(Icons.schedule, color: Colors.grey),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Security: PIN Entry
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF13ec13).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF13ec13).withOpacity(0.2),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Confirm with Transaction PIN',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Footer Action Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF13ec13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Set Standing Order',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
          fillColor: isDark ? Colors.white10 : Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: isDark ? Colors.white24 : Colors.grey.shade300,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF13ec13), width: 2),
          ),
        ),
      ),
    );
  }
}
