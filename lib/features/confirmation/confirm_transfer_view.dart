import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/typography.dart';

class ConfirmTransferView extends StatelessWidget {
  const ConfirmTransferView({Key? key}) : super(key: key);

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
          'Confirm Transfer',
          style: TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontWeight: AppTypography.bold,
            color: isDark ? Colors.white : cardDark,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Recipient Info
              const SizedBox(height: 16),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 112,
                      height: 112,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuCoIVq4dcaumlhydT-tqvK5tzXjAIYabYj-06OOmpZNXD6WlymiZq4fHWJOc1_eMLsJJGKJZDiGYsxCOMv-AOYs2K7qJOcb9UrIlwG6lVNlXhYH9N8bNRZXWdHWSoENZFFhaGpFVfROBqq3w4vIyV27SKiRbX9CFd4GcSs9HZc2lTA3CleGxpWdsp3I0PplzSDKXWjq6BR_gtfQL1rNVEKabi1yMztU0icQeV6dAEioMqdNFnpeS7RIH5pePitHAwabdNCr_8GZrd86',
                          ),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: primary.withOpacity(0.2),
                          width: 4,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDark ? bgDark : Colors.white,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Icon(Icons.verified, color: cardDark, size: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'John Doe',
                style: TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: isDark ? Colors.white : cardDark,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '0712 345 456',
                    style: TextStyle(
                      color: primary.withOpacity(0.7),
                      fontSize: 16,
                      fontFamily: AppTypography.fontFamily,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'M-Pesa',
                    style: TextStyle(
                      color: primary.withOpacity(0.7),
                      fontSize: 16,
                      fontFamily: AppTypography.fontFamily,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Transfer Details Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark ? Colors.white10 : const Color(0xFFDBE6DB),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Text(
                        'Transfer Details',
                        style: TextStyle(
                          color: primary.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppTypography.fontFamily,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Provider',
                            style: TextStyle(
                              color: primary.withOpacity(0.7),
                              fontSize: 14,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                          Text(
                            'KB Mobile / M-Pesa',
                            style: TextStyle(
                              color: isDark ? Colors.white : cardDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reference',
                            style: TextStyle(
                              color: primary.withOpacity(0.7),
                              fontSize: 14,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                          Text(
                            'Home Rent - Jan',
                            style: TextStyle(
                              color: isDark ? Colors.white : cardDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Text(
                        'Cost Summary',
                        style: TextStyle(
                          color: primary.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppTypography.fontFamily,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount',
                            style: TextStyle(
                              color: primary.withOpacity(0.7),
                              fontSize: 14,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                          Text(
                            'KES 5,000.00',
                            style: TextStyle(
                              color: isDark ? Colors.white : cardDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction Fee',
                            style: TextStyle(
                              color: primary.withOpacity(0.7),
                              fontSize: 14,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                          Text(
                            'KES 15.00',
                            style: TextStyle(
                              color: isDark ? Colors.white : cardDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total to Debit',
                            style: TextStyle(
                              color: isDark ? Colors.white : cardDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                          Text(
                            'KES 5,015.00',
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Security Note
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark ? Colors.white10 : const Color(0xFFDBE6DB),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.shield, color: primary, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Security Note',
                            style: TextStyle(
                              fontFamily: AppTypography.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: isDark ? Colors.white : cardDark,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Securely processed by KB Bank using end-to-end encryption.',
                            style: TextStyle(
                              color: primary.withOpacity(0.7),
                              fontSize: 12,
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
              // Confirm & Cancel Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.face),
                  label: const Text('Confirm & Send'),
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
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel Transfer',
                  style: TextStyle(
                    color: primary.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: AppTypography.fontFamily,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
