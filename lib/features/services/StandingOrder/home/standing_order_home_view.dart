import 'package:flutter/material.dart';
import '../select/standing_order_select_view.dart';

class StandingOrderHomeView extends StatelessWidget {
  const StandingOrderHomeView({Key? key}) : super(key: key);

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
          'Standing Orders',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            color: isDark ? Colors.white : const Color(0xFF111811),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFF13ec13).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 80,
                      color: const Color(0xFF13ec13),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isDark ? Colors.grey[900] : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF13ec13),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.payments,
                          size: 32,
                          color: const Color(0xFF13ec13),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'No standing orders yet',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 8),
              Text(
                'Create automatic payments and transfers to save time and stay on top of your bills.',
                style: TextStyle(color: Color(0xFF618961), fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add Standing Order'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF13ec13),
                    foregroundColor: const Color(0xFF111811),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StandingOrderSelectView(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: isDark ? const Color(0xFF111811) : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _NavBarItem(icon: Icons.home, label: 'Home'),
            _NavBarItem(icon: Icons.payments, label: 'Payments'),
            _NavBarItem(icon: Icons.sync_alt, label: 'Transfers'),
            _NavBarItem(
              icon: Icons.history_toggle_off,
              label: 'Orders',
              selected: true,
            ),
            _NavBarItem(icon: Icons.account_circle, label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  const _NavBarItem({
    required this.icon,
    required this.label,
    this.selected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: selected
              ? const Color(0xFF13ec13)
              : (isDark ? Colors.grey[500] : const Color(0xFF618961)),
          size: 24,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: selected
                ? const Color(0xFF13ec13)
                : (isDark ? Colors.grey[500] : const Color(0xFF618961)),
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
