import 'package:dailyflow/core/widget/auth_input.dart';
import 'package:dailyflow/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // để validate dữ liệu trong form
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
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
                  _buildFormLogin(),
                  const SizedBox(height: 28),
                  _buildOrDivider(context),
                  const SizedBox(height: 20),
                  _buildGoogleLoginButton(context),
                  const SizedBox(height: 14),
                  _buildAppleLoginButton(context),
                  const SizedBox(height: 28),
                  _buildRegisterLink(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormLogin() {
    // bọc form ở ngoài để validate dữ liệu
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            _buildUsernameField(context),
            const SizedBox(height: 24),
            _buildPasswordField(context),
            const SizedBox(height: 36),
            _buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameField(BuildContext context) {
    return AuthInput(
      controller: _usernameController,
      hintText: context.tr('login_page.username_hint'),
      labelText: context.tr('login_page.username'),
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

  Widget _buildPasswordField(BuildContext context) {
    return AuthInput(
      controller: _passwordController,
      hintText: context.tr('login_page.password_hint'),
      labelText: context.tr('login_page.password'),
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

  Widget _buildLoginButton(BuildContext context) {
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
        onPressed: () {
          _onHandleLoginSubmit();
          // Navigator.pushReplacementNamed(context, Routes.main);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          context.tr('login_page.login_button'),
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

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('login_page.title'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Welcome back! Sign in to continue',
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildOrDivider(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.white30)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            context.tr('login_page.or'),
            style: const TextStyle(color: Colors.white54),
          ),
        ),
        const Expanded(child: Divider(color: Colors.white30)),
      ],
    );
  }

  Widget _buildGoogleLoginButton(BuildContext context) {
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
          context.tr('login_page.login_google'),
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

  // Apple login button
  Widget _buildAppleLoginButton(BuildContext context) {
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
          context.tr('login_page.login_apple'),
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

  // Register link at the bottom
  Widget _buildRegisterLink(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.register);
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    "${context.tr('login_page.register_link').split('?')[0]}? ",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 15,
                ),
              ),
              TextSpan(
                text: context.tr('login_page.register_link').split('?')[1],
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

  // event
  void _onHandleLoginSubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      // login các kiểu
      // Xử lý đăng nhập ở đây
      Navigator.pushReplacementNamed(context, Routes.main);
    } else {
      ///...
    }
  }
}
