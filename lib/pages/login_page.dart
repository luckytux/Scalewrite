// File: lib/pages/login_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../widgets/common/rounded_text_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final uidController = TextEditingController();
  final passwordController = TextEditingController();
  String? error;

  void _submitLogin(BuildContext context) async {
    final auth = ref.read(authControllerProvider.notifier);
    final success = await auth.login(
      uidController.text.trim(),
      passwordController.text.trim(),
    );

    if (!mounted) return;

    if (success) {
      final isAdmin = ref.read(authControllerProvider)?.isAdmin ?? false;
      Navigator.pushReplacementNamed(context, isAdmin ? '/admin' : '/home');
    } else {
      setState(() => error = 'Invalid UID or password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/scalewrite_logo.png',
              fit: BoxFit.contain,
              height: 400,
            ),
          ),
          const SizedBox(height: 0),
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                width: 400,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withAlpha((0.95 * 255).toInt()),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Welcome to ScaleWrite',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    RoundedTextField(
                      controller: uidController,
                      label: 'User ID',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    ),
                    const SizedBox(height: 16),
                    RoundedTextField(
                      controller: passwordController,
                      label: 'Password',
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () => _submitLogin(context),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => _submitLogin(context),
                      child: const Text('Login'),
                    ),
                    if (error != null) ...[
                      const SizedBox(height: 12),
                      Text(error!, style: const TextStyle(color: Colors.red)),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
