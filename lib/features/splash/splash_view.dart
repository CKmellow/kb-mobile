import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../auth/login/login_view.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/strings.dart';
import '../../core/constants/typography.dart';
import '../../core/constants/spacing.dart';


class SplashView extends StatefulWidget {
	const SplashView({Key? key}) : super(key: key);

	@override
	State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
	late AnimationController _controller;
	late Animation<double> _animation;

	@override
	void initState() {
		super.initState();
		_controller = AnimationController(
			vsync: this,
			duration: const Duration(seconds: 2),
		)..repeat(reverse: false);
		_animation = Tween<double>(begin: 0.0, end: 1.0).animate(
			CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
		);
		// Navigate to LoginView after 2.5 seconds
		Future.delayed(const Duration(milliseconds: 2500), () {
			if (mounted) {
				Navigator.of(context).pushReplacement(
					MaterialPageRoute(builder: (_) => const LoginView()),
				);
			}
		});
	}

	@override
	void dispose() {
		_controller.dispose();
		super.dispose();
	}

	@override
	  Widget build(BuildContext context) {
	    final isDark = Theme.of(context).brightness == Brightness.dark;
	    return Scaffold(
	      backgroundColor: isDark ? AppColors.backgroundDark : Colors.white,
	      body: SafeArea(
		child: Container(
		  width: double.infinity,
		  height: double.infinity,
		  decoration: const BoxDecoration(
		    gradient: RadialGradient(
		      center: Alignment.topLeft,
		      radius: 1.2,
		      colors: [
			Color(0x0D13EC13),
			Colors.transparent,
		      ],
		      stops: [0.0, 0.5],
		    ),
		  ),
		  child: Column(
		    children: [
		      const SizedBox(height: 48),
		      Expanded(
			child: Column(
			  mainAxisAlignment: MainAxisAlignment.center,
			  children: [
			    // Logo Representation
			    Stack(
			      alignment: Alignment.center,
			      children: [
				// Glow effect
				Container(
				  width: 128,
				  height: 128,
				  decoration: BoxDecoration(
				    color: AppColors.primary.withOpacity(0.1),
				    shape: BoxShape.circle,
				    boxShadow: [
				      BoxShadow(
					color: AppColors.primary.withOpacity(0.1),
					blurRadius: 48,
					spreadRadius: 8,
				      ),
				    ],
				  ),
				),
				// Logo box with image
				Container(
				  width: 96,
				  height: 96,
				  decoration: BoxDecoration(
				    color: isDark ? AppColors.backgroundDark : Colors.white,
				    borderRadius: BorderRadius.circular(24),
				    border: Border.all(
				      color: AppColors.borderPrimary,
				      width: 1,
				    ),
				    boxShadow: [
				      BoxShadow(
					color: AppColors.shadowPrimary,
					blurRadius: 24,
					offset: const Offset(0, 8),
				      ),
				    ],
				  ),
				  child: Center(
				    child: Image.asset(
				      'assets/images/kb_logo.png',
				      width: 48,
				      height: 48,
				      fit: BoxFit.contain,
				    ),
				  ),
				),
			      ],
			    ),
			    const SizedBox(height: 24),
			    Text(
			      AppStrings.appName,
			      style: TextStyle(
				fontFamily: AppTypography.fontFamily,
				fontWeight: AppTypography.bold,
				fontSize: 28,
				color: isDark ? AppColors.textLight : AppColors.textDark,
				letterSpacing: -0.5,
			      ),
			      textAlign: TextAlign.center,
			    ),
			    const SizedBox(height: 4),
			    Text(
			      AppStrings.tagline,
			      style: TextStyle(
				fontFamily: AppTypography.fontFamily,
				fontWeight: AppTypography.medium,
				fontSize: 14,
				color: isDark
				    ? AppColors.primary.withOpacity(0.7)
				    : AppColors.textSecondary,
				letterSpacing: 1.2,
				height: 1.2,
				textBaseline: TextBaseline.alphabetic,
			      ),
			      textAlign: TextAlign.center,
			    ),
			  ],
			),
		      ),
		      Padding(
			padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
			child: Column(
			  mainAxisSize: MainAxisSize.min,
			  children: [
			    // Minimalist Loading Indicator
			    Column(
			      crossAxisAlignment: CrossAxisAlignment.stretch,
			      children: [
				Center(
				  child: Text(
				    AppStrings.securingConnection,
				    style: TextStyle(
				      fontFamily: AppTypography.fontFamily,
				      fontWeight: AppTypography.medium,
				      fontSize: 12,
				      color: isDark
					  ? AppColors.primary.withOpacity(0.6)
					  : AppColors.textSecondary,
				      letterSpacing: 0.5,
				    ),
				  ),
				),
				const SizedBox(height: 8),
				// Animated Progress Bar
				Container(
				  height: 6,
				  decoration: BoxDecoration(
				    color: isDark
					? AppColors.primary.withOpacity(0.1)
					: AppColors.progressBarBg,
				    borderRadius: BorderRadius.circular(9999),
				  ),
				  child: Align(
				    alignment: Alignment.centerLeft,
				    child: AnimatedBuilder(
				      animation: _animation,
				      builder: (context, child) {
					return FractionallySizedBox(
					  widthFactor: 0.3 + 0.7 * _animation.value, // animate from 30% to 100%
					  child: Container(
					    height: 6,
					    decoration: BoxDecoration(
					      color: AppColors.primary,
					      borderRadius: BorderRadius.circular(9999),
					    ),
					  ),
					);
				      },
				    ),
				  ),
				),
			      ],
			    ),
			    const SizedBox(height: 32),
			    Text(
			      AppStrings.licensedByCBK,
			      style: TextStyle(
				fontFamily: AppTypography.fontFamily,
				fontWeight: AppTypography.regular,
				fontSize: 10,
				color: isDark
				    ? AppColors.primary.withOpacity(0.4)
				    : AppColors.textSecondary.withOpacity(0.7),
				letterSpacing: 2.0,
				height: 1.2,
			      ),
			      textAlign: TextAlign.center,
			    ),
			    const SizedBox(height: 20),
			  ],
			),
		      ),
		    ],
		  ),
		),
	      ),
	    );
	  }
}
