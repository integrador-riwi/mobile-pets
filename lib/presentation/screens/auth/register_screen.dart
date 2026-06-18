import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _acceptTerms = false;

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmFocus = FocusNode();

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmFocus.dispose();
    super.dispose();
  }

  static const Color _primary = Color(0xFF3A80C2);
  static const Color _bg = Color(0xFFF0F4F4);
  static const Color _inputFill = Color(0xFFEEF3F3);
  static const Color _textDark = Color(0xFF1A1A2E);
  static const Color _textMuted = Color(0xFF6B7280);
  static const Color _textLight = Color(0xFF9AA0B2);
  static const Color _divider = Color(0xFFE0E4F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              _buildLogo(),
              const SizedBox(height: 32),
              _buildCard(),
              const SizedBox(height: 28),
              _buildFooter(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: _primary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.pets, color: Colors.white, size: 30),
        ),
        const SizedBox(width: 12),
        const Text(
          'Balto',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: _primary,
          ),
        ),
      ],
    );
  }

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Create your\nBalto account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: _textDark,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Join the premium sanctuary for you and your companion.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: _textMuted, height: 1.5),
            ),
          ),
          const SizedBox(height: 28),
          _fieldLabel('Full Name'),
          const SizedBox(height: 8),
          _nameField(),
          const SizedBox(height: 20),
          _fieldLabel('Email Address'),
          const SizedBox(height: 8),
          _emailField(),
          const SizedBox(height: 20),
          _fieldLabel('Password'),
          const SizedBox(height: 8),
          _passwordField(),
          const SizedBox(height: 20),
          _fieldLabel('Confirm Password'),
          const SizedBox(height: 8),
          _confirmPasswordField(),
          const SizedBox(height: 16),
          _termsRow(),
          const SizedBox(height: 20),
          _signUpButton(),
          const SizedBox(height: 24),
          _orDivider(),
          const SizedBox(height: 20),
          _socialRow(),
          const SizedBox(height: 24),
          _signInRow(),
        ],
      ),
    );
  }

  Widget _fieldLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: _textDark,
      ),
    );
  }

  Widget _nameField() {
    return TextField(
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      onSubmitted: (_) => _emailFocus.requestFocus(),
      style: const TextStyle(fontSize: 14, color: _textDark),
      decoration: InputDecoration(
        hintText: 'Your name',
        hintStyle: const TextStyle(color: _textLight, fontSize: 14),
        prefixIcon: const Icon(
          Icons.person_outline,
          color: _textMuted,
          size: 20,
        ),
        filled: true,
        fillColor: _inputFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      focusNode: _emailFocus,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: TextInputAction.next,
      onSubmitted: (_) => _passwordFocus.requestFocus(),
      style: const TextStyle(fontSize: 14, color: _textDark),
      decoration: InputDecoration(
        hintText: 'name@email.com',
        hintStyle: const TextStyle(color: _textLight, fontSize: 14),
        prefixIcon: const Icon(Icons.mail_outline, color: _textMuted, size: 20),
        filled: true,
        fillColor: _inputFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      focusNode: _passwordFocus,
      obscureText: _obscurePassword,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: TextInputAction.next,
      onSubmitted: (_) => _confirmFocus.requestFocus(),
      style: const TextStyle(fontSize: 14, color: _textDark),
      decoration: InputDecoration(
        hintText: '••••••••',
        hintStyle: const TextStyle(
          color: _textMuted,
          fontSize: 18,
          letterSpacing: 2,
        ),
        prefixIcon: const Icon(Icons.lock_outline, color: _textMuted, size: 20),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: _textMuted,
            size: 20,
          ),
          onPressed: () =>
              setState(() => _obscurePassword = !_obscurePassword),
        ),
        filled: true,
        fillColor: _inputFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _confirmPasswordField() {
    return TextField(
      focusNode: _confirmFocus,
      obscureText: _obscureConfirm,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: TextInputAction.done,
      style: const TextStyle(fontSize: 14, color: _textDark),
      decoration: InputDecoration(
        hintText: '••••••••',
        hintStyle: const TextStyle(
          color: _textMuted,
          fontSize: 18,
          letterSpacing: 2,
        ),
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: _textMuted,
          size: 20,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureConfirm
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: _textMuted,
            size: 20,
          ),
          onPressed: () =>
              setState(() => _obscureConfirm = !_obscureConfirm),
        ),
        filled: true,
        fillColor: _inputFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _termsRow() {
    return InkWell(
      onTap: () => setState(() => _acceptTerms = !_acceptTerms),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: _acceptTerms,
                onChanged: (v) => setState(() => _acceptTerms = v ?? false),
                activeColor: _primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: const BorderSide(color: Color(0xFFCDD2E0), width: 1.5),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: RichText(
                text: const TextSpan(
                  text: 'I agree to the ',
                  style: TextStyle(fontSize: 13, color: Color(0xFF4A4A6A)),
                  children: [
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: _primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: _primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: _primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create Account',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _orDivider() {
    return Row(
      children: const [
        Expanded(child: Divider(color: _divider, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'OR SIGN UP WITH',
            style: TextStyle(
              fontSize: 11,
              color: _textLight,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Divider(color: _divider, thickness: 1)),
      ],
    );
  }

  Widget _socialRow() {
    return Row(
      children: [
        Expanded(
          child: _SocialButton(
            label: 'Google',
            icon: SvgPicture.asset(
              'assets/icons/google.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _SocialButton(
            label: 'Apple',
            icon: const Icon(Icons.apple, size: 22, color: _textDark),
          ),
        ),
      ],
    );
  }

  Widget _signInRow() {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: RichText(
          text: const TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(fontSize: 14, color: Color(0xFF4A4A6A)),
            children: [
              TextSpan(
                text: 'Sign In',
                style: TextStyle(
                  color: _primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _footerLink('Privacy Policy'),
            _footerSeparator(),
            _footerLink('Terms of Service'),
            _footerSeparator(),
            _footerLink('Help Center'),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          '© 2026 Balto Inc. Secure Signup',
          style: TextStyle(fontSize: 11, color: _textLight),
        ),
      ],
    );
  }

  Widget _footerSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text('·', style: TextStyle(color: _textLight, fontSize: 11)),
    );
  }

  Widget _footerLink(String text) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        text,
        style: const TextStyle(fontSize: 11, color: _textLight),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.label, required this.icon});

  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: const BorderSide(color: Color(0xFFDDE1F0), width: 1.5),
        backgroundColor: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    );
  }
}

