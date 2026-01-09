import 'package:flutter/material.dart';
import 'package:qleanfeel_app/features/auth/domain/validators/phone_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:qleanfeel_app/core/router/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qleanfeel_app/features/auth/presentation/bloc/auth_cubit.dart';

class EnterPhoneScreen extends StatefulWidget {
  const EnterPhoneScreen({super.key});

  @override
  State<EnterPhoneScreen> createState() => _EnterPhoneScreenState();
}

class _EnterPhoneScreenState extends State<EnterPhoneScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  bool _isValid = false;
  bool _isLoading = false;

  void _onChanged(String value) {
    final isValid = PhoneValidator.validate(value) == null;
    if (isValid != _isValid) {
      setState(() => _isValid = isValid);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // TODO: authRepository.sendCode(phone)
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    setState(() => _isLoading = false);
    context.read<AuthCubit>().sendCode(_controller.text);
    context.go(AppRoutes.loginCode);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),

                Text(
                  'Вход',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),

                Text(
                  'Введите номер телефона — пришлём код',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),

                TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.phone,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Номер телефона',
                    hintText: '+7 999 123-45-67',
                  ),
                  validator: (value) =>
                      PhoneValidator.validate(value ?? ''),
                  onChanged: _onChanged,
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: (_isValid && !_isLoading) ? _submit : null,
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Продолжить'),
                  ),
                ),

                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}