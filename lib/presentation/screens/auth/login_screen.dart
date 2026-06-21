import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'forgot_password_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _rememberDevice = false;

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
              'Welcome back to\nBalto',
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
              'The premium sanctuary for you and your companion.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: _textMuted, height: 1.5),
            ),
          ),
          const SizedBox(height: 28),
          _fieldLabel('Email Address'),
          const SizedBox(height: 8),
          _emailField(),
          const SizedBox(height: 20),
          _passwordLabelRow(),
          const SizedBox(height: 8),
          _passwordField(),
          const SizedBox(height: 12),
          _rememberRow(),
          const SizedBox(height: 20),
          _signInButton(),
          const SizedBox(height: 24),
          _orDivider(),
          const SizedBox(height: 20),
          _socialRow(),
          const SizedBox(height: 24),
          _createAccountRow(),
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

  Widget _emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: TextInputAction.next,
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

  Widget _passwordLabelRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _textDark,
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
          ),
          borderRadius: BorderRadius.circular(8),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 14,
                color: _primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _passwordField() {
    return TextField(
      obscureText: _obscurePassword,
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

  Widget _rememberRow() {
    return InkWell(
      onTap: () => setState(() => _rememberDevice = !_rememberDevice),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: _rememberDevice,
                onChanged: (v) => setState(() => _rememberDevice = v ?? false),
                activeColor: _primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: const BorderSide(color: Color(0xFFCDD2E0), width: 1.5),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Remember this device',
              style: TextStyle(fontSize: 14, color: Color(0xFF4A4A6A)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInButton() {
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
              'Sign In',
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
            'OR CONTINUE WITH',
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

  Widget _createAccountRow() {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const RegisterScreen()),
        ),
        child: RichText(
          text: const TextSpan(
            text: 'New to Balto? ',
            style: TextStyle(fontSize: 14, color: Color(0xFF4A4A6A)),
            children: [
              TextSpan(
                text: 'Create Account',
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
            _FooterLink('Privacy Policy'),
            _footerSeparator(),
            _FooterLink('Terms of Service'),
            _footerSeparator(),
            _FooterLink('Help Center'),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          '© 2026 Balto Inc. Secure Login',
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

  Widget _FooterLink(String text) {
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

