import 'package:flutter/material.dart';

/// ============================================================================
/// MedFinder — Register Screen
/// ============================================================================
/// Pure presentation layer, matching the design language of login_screen.dart
/// (colors, spacing, typography, radii). This screen intentionally contains:
///   - No Firebase / API calls
///   - No authentication logic
///   - No form validation
///
/// [TextEditingController]s, callbacks, and a [Form] wrapper (with
/// validators) can be added later without restructuring this widget tree —
/// every actionable spot is marked with a `// TODO` comment.
///
/// NOTE ON DUPLICATION: `_MedFinderColors`, `_MedFinderMetrics`,
/// `_MedFinderTextField`, `_PrimaryButton`, `_OrDivider`, and
/// `_GoogleSignInButton` intentionally mirror the private widgets in
/// login_screen.dart so this file stays a self-contained drop-in. Once both
/// screens exist, pull these into `core/theme/` and `shared/widgets/` and
/// import them from both screens instead of duplicating.
/// ============================================================================

abstract final class _MedFinderColors {
  static const Color primary = Color(0xFF0F9D58);
  static const Color primaryDark = Color(0xFF0B7A43);
  static const Color background = Colors.white;
  static const Color textPrimary = Color(0xFF1A1D1F);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color fieldFill = Color(0xFFF4F6F5);
  static const Color fieldBorder = Color(0xFFE1E6E4);
}

abstract final class _MedFinderMetrics {
  static const double fieldRadius = 18;
  static const double buttonRadius = 18;
  static const double logoRadius = 22;
  static const double screenPadding = 24;
}

// ============================================================================
// Screen
// ============================================================================

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers live here so the screen is ready to be wired directly into
  // an auth service / bloc / provider later.
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: _MedFinderColors.background,
      body: SafeArea(
        child: Center(
          // Caps the form width on tablets/foldables while staying full
          // width on phones — keeps the layout readable on every Android
          // screen size.
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: _MedFinderMetrics.screenPadding,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: screenSize.height * 0.02),

                  const _LogoPlaceholder(),
                  const SizedBox(height: 24),

                  const _RegisterHeader(),
                  const SizedBox(height: 32),

                  _MedFinderTextField(
                    controller: _fullNameController,
                    hintText: 'Full name',
                    icon: Icons.person_outline_rounded,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),

                  _MedFinderTextField(
                    controller: _emailController,
                    hintText: 'Email address',
                    icon: Icons.mail_outline_rounded,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),

                  _MedFinderTextField(
                    controller: _phoneController,
                    hintText: 'Phone number',
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),

                  _MedFinderTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    icon: Icons.lock_outline_rounded,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.next,
                    suffixIcon: IconButton(
                      onPressed: _togglePasswordVisibility,
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: _MedFinderColors.textSecondary,
                        size: 21,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  _MedFinderTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm password',
                    icon: Icons.lock_outline_rounded,
                    obscureText: _obscureConfirmPassword,
                    textInputAction: TextInputAction.done,
                    suffixIcon: IconButton(
                      onPressed: _toggleConfirmPasswordVisibility,
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: _MedFinderColors.textSecondary,
                        size: 21,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  _PrimaryButton(
                    label: 'Create Account',
                    onPressed: () {
                      // TODO: Hook up registration logic (Firebase/API).
                    },
                  ),
                  const SizedBox(height: 28),

                  const _OrDivider(),
                  const SizedBox(height: 28),

                  _GoogleSignInButton(
                    onPressed: () {
                      // TODO: Hook up Google Sign-In logic.
                    },
                  ),

                  SizedBox(height: screenSize.height * 0.04),

                  _LoginFooter(
                    onLoginTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// Reusable, stateless building blocks
// ============================================================================

/// Placeholder mark for the MedFinder brand logo — identical treatment to
/// the login screen.
class _LogoPlaceholder extends StatelessWidget {
  const _LogoPlaceholder();

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with the real MedFinder logo, e.g.
    // Image.asset('assets/images/medfinder_logo.png', height: 84).
    return Center(
      child: Container(
        height: 84,
        width: 84,
        decoration: BoxDecoration(
          color: _MedFinderColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(_MedFinderMetrics.logoRadius),
        ),
        child: const Icon(
          Icons.health_and_safety_rounded,
          color: _MedFinderColors.primary,
          size: 42,
        ),
      ),
    );
  }
}

/// "Create Account" heading + supporting subtitle.
class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Create Account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: _MedFinderColors.textPrimary,
            letterSpacing: 0.2,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Join MedFinder to find medicines near you, faster.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: _MedFinderColors.textSecondary,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

/// Consistent, rounded text field — same styling as the login screen, reused
/// here for all five register fields.
class _MedFinderTextField extends StatelessWidget {
  const _MedFinderTextField({
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    // Plain TextField — swap for TextFormField inside a Form once
    // validation logic is introduced.
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: const TextStyle(
        fontSize: 15,
        color: _MedFinderColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: _MedFinderColors.fieldFill,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: _MedFinderColors.textSecondary,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(icon, color: _MedFinderColors.textSecondary, size: 22),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_MedFinderMetrics.fieldRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_MedFinderMetrics.fieldRadius),
          borderSide: const BorderSide(
            color: _MedFinderColors.fieldBorder,
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_MedFinderMetrics.fieldRadius),
          borderSide: const BorderSide(
            color: _MedFinderColors.primary,
            width: 1.6,
          ),
        ),
      ),
    );
  }
}

/// Full-width, filled green CTA button — used here for "Create Account".
class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _MedFinderColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_MedFinderMetrics.buttonRadius),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}

/// "OR" divider used to separate the form from social sign-up.
class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(color: _MedFinderColors.fieldBorder, thickness: 1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'OR',
            style: TextStyle(
              color: _MedFinderColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: _MedFinderColors.fieldBorder, thickness: 1),
        ),
      ],
    );
  }
}

/// Outlined "Continue with Google" button.
class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: _MedFinderColors.textPrimary,
          side: const BorderSide(
            color: _MedFinderColors.fieldBorder,
            width: 1.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_MedFinderMetrics.buttonRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Add the official Google "G" logo at
            // assets/icons/google_logo.png and register it in pubspec.yaml.
            // Falls back to an icon glyph until the asset exists.
            Image.asset(
              'assets/icons/google_logo.png',
              height: 20,
              width: 20,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.g_mobiledata_rounded,
                size: 24,
                color: _MedFinderColors.textSecondary,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Continue with Google',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

/// "Already have an account? Login" footer row.
class _LoginFooter extends StatelessWidget {
  const _LoginFooter({required this.onLoginTap});

  final VoidCallback onLoginTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(color: _MedFinderColors.textSecondary, fontSize: 14),
        ),
        GestureDetector(
          onTap: onLoginTap,
          child: const Text(
            'Login',
            style: TextStyle(
              color: _MedFinderColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
