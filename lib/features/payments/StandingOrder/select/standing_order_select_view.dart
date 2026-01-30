import 'package:flutter/material.dart';
import '../new_transfer/standing_new_transfer_view.dart';
import '../mobile/standing_mobile_view.dart';
import '../airtime/standing_airtime_view.dart';

class StandingOrderSelectView extends StatefulWidget {
  const StandingOrderSelectView({Key? key}) : super(key: key);

  @override
  State<StandingOrderSelectView> createState() =>
      _StandingOrderSelectViewState();
}

class _StandingOrderSelectViewState extends State<StandingOrderSelectView> {
  // No selection state needed, navigation is instant

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF102210)
          : const Color(0xFFF6F8F6),
      appBar: AppBar(
        backgroundColor: isDark
            ? const Color(0xFF102210)
            : const Color(0xFFF6F8F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: isDark ? Colors.white : const Color(0xFF111811),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Select Standing Order',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'What type of recurring payment would you like to set up?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose a category to automate your future transactions.',
              style: TextStyle(color: Color(0xFF618961), fontSize: 14),
            ),
            const SizedBox(height: 24),
            _OrderTypeTile(
              icon: Icons.account_balance,
              title: 'Transfer',
              subtitle: 'Bank to bank transfers',
              selected: false,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StandingNewTransferView(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _OrderTypeTile(
              icon: Icons.smartphone,
              title: 'Mobile Money',
              subtitle: 'M-PESA / Airtel Money',
              selected: false,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StandingMobileView(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _OrderTypeTile(
              icon: Icons.signal_cellular_alt,
              title: 'Airtime',
              subtitle: 'Recharge your line daily/weekly',
              selected: false,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StandingAirtimeView(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuClLOUL4CHbucI68V3dVIymH9onwdTErW3ySeQO9aQC09HmqUGNMukoMGSrZOyUsmewsZtaDGA8PX7oo8tQ1-C9VMWYJQ72uiM7oXlgY7UWi4Gn7JqsU_0rb_rKxK2zyWNwbyz8UKszyWMB3GqHgJjb0U9aqdWzKYkKPHrYMerOgJ9OjgDSItI-0a1FClpGqeTYByiGVP2CpoquzS50z1lSf6DiVnSbXmAiiB6o7DW8ohZezM7_Vf90mhItj_1JLvaw7uXJfy_brzou',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Secure & Automated',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xFF102210),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _OrderTypeTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;
  const _OrderTypeTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[900] : Colors.white,
          border: Border.all(
            color: selected
                ? const Color(0xFF13ec13)
                : (isDark ? Colors.grey[800]! : const Color(0xFFE5E7EB)),
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF13ec13).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF13ec13), size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: isDark ? Colors.white : const Color(0xFF111811),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF618961),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: selected ? const Color(0xFF13ec13) : Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
