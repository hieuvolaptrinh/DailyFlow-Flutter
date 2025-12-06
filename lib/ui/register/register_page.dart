import 'package:dailyflow/core/widget/auth_input.dart';
import 'package:dailyflow/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: _buildBackgroundGradient(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBackButton(context),
                  const SizedBox(height: 40),
                  _buildHeader(context),
                  const SizedBox(height: 40),
                  _buildFormRegister(),
                  const SizedBox(height: 24),
                  _buildOrDivider(context),
                  const SizedBox(height: 20),
                  _buildGoogleRegisterButton(context),
                  const SizedBox(height: 14),
                  _buildAppleRegisterButton(context),
                  const SizedBox(height: 28),
                  _buildLoginLink(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Background gradient decoration
  BoxDecoration _buildBackgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFF121212),
          const Color(0xFF1E1E1E),
          const Color(0xFF121212),
        ],
      ),
    );
  }

  // Back button widget
  Widget _buildBackButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        padding: const EdgeInsets.all(8),
      ),
    );
  }

  // Header with title and subtitle
  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('register_page.title'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Create your account to get started',
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16),
        ),
      ],
    );
  }

  // Form register with validation
  Widget _buildFormRegister() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildUsernameField(context),
          const SizedBox(height: 20),
          _buildPasswordField(context),
          const SizedBox(height: 20),
          _buildConfirmPasswordField(context),
          const SizedBox(height: 32),
          _buildRegisterButton(context),
        ],
      ),
    );
  }

  // Username input field
  Widget _buildUsernameField(BuildContext context) {
    return AuthInput(
      controller: _usernameController,
      hintText: context.tr('register_page.username_hint'),
      labelText: context.tr('register_page.username'),
      prefixIcon: Icons.person_outline,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username is required';
        }
        if (value.length < 3) {
          return 'Username must be at least 3 characters';
        }
        return null;
      },
    );
  }

  // Password input field
  Widget _buildPasswordField(BuildContext context) {
    return AuthInput(
      controller: _passwordController,
      hintText: context.tr('register_page.password_hint'),
      labelText: context.tr('register_page.password'),
      prefixIcon: Icons.lock_outline,
      obscureText: _obscurePassword,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: const Color(0xFF8687E7),
        ),
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  // Confirm password input field
  Widget _buildConfirmPasswordField(BuildContext context) {
    return AuthInput(
      controller: _confirmPasswordController,
      hintText: context.tr('register_page.confirm_password_hint'),
      labelText: context.tr('register_page.confirm_password'),
      prefixIcon: Icons.lock_outline,
      obscureText: _obscureConfirmPassword,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureConfirmPassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: const Color(0xFF8687E7),
        ),
        onPressed: () {
          setState(() {
            _obscureConfirmPassword = !_obscureConfirmPassword;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  // Primary register button
  Widget _buildRegisterButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8687E7), Color(0xFF9F7AEA)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8687E7).withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: _onHandleRegisterSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          context.tr('register_page.register_button'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  // OR divider
  Widget _buildOrDivider(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.white30)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            context.tr('register_page.or'),
            style: const TextStyle(color: Colors.white54),
          ),
        ),
        const Expanded(child: Divider(color: Colors.white30)),
      ],
    );
  }

  // Google register button
  Widget _buildGoogleRegisterButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF3C3C3C), width: 1.5),
      ),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Image.asset('assets/images/google.png', width: 24, height: 24),
        label: Text(
          context.tr('register_page.register_google'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  // Apple register button
  Widget _buildAppleRegisterButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF3C3C3C), width: 1.5),
      ),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Image.asset('assets/images/apple.png', width: 24, height: 24),
        label: Text(
          context.tr('register_page.register_apple'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  // Login link at the bottom
  Widget _buildLoginLink(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.login);
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    "${context.tr('register_page.login_link').split('?')[0]}? ",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 15,
                ),
              ),
              TextSpan(
                text: context.tr('register_page.login_link').split('?')[1],
                style: const TextStyle(
                  color: Color(0xFF8687E7),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Handle register submit
  void _onHandleRegisterSubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      // Xử lý đăng ký ở đây
      Navigator.pushReplacementNamed(context, Routes.main);
    }
  }
}
