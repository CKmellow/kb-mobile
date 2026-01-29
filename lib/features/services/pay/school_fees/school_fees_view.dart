import 'package:flutter/material.dart';
import '../../../../core/constants/typography.dart';
import '../../../../core/constants/colors.dart';

class SchoolFeesView extends StatelessWidget {
  const SchoolFeesView({Key? key}) : super(key: key);

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
          'School Fees',
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
                    value: 'current',
                    child: Text(
                      'Current Account - 0112 4598 2210 (KES 145,200.00)',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'savings',
                    child: Text(
                      'Savings Account - 0115 8821 0034 (KES 82,450.50)',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'joint',
                    child: Text(
                      'Joint Account - 0118 1190 5543 (KES 12,100.00)',
                    ),
                  ),
                ],
                onChanged: (v) {},
              ),
              const SizedBox(height: 20),
              Text(
                'Select School',
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
                  hintText: 'Search for a school or enter name',
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
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
                'Student ID / Admission Number',
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
                  hintText: 'e.g. ADM-2023-042',
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
                'Student Full Name',
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
                  hintText: "Enter student's name",
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
              Text(
                'Daily limit: KES 1,000,000.00',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.notifications_active, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    'Save as Beneficiary',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: isDark ? Colors.white : cardDark,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Easier future payments',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark
                          ? primary.withOpacity(0.6)
                          : const Color(0xFF618961),
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
