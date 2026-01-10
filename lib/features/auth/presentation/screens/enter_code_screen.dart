import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qleanfeel_app/features/auth/presentation/bloc/auth_cubit.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  final _controller = TextEditingController();

  bool _isValid = false;
  bool _isLoading = false;

  static const _codeLength = 6;
  static const _resendDelay = 30;

  int _secondsLeft = _resendDelay;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsLeft = _resendDelay;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _onChanged(String value) {
  final isValid = value.length == _codeLength;

  if (isValid != _isValid) {
    setState(() => _isValid = isValid);
  }

  if (isValid && !_isLoading) {
    _submit();
  }

}

  Future<void> _submit() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    // TODO: authRepository.verifyCode(code)
    // await Future.delayed(const Duration(seconds: 1));
   // if (!mounted) return;
    //setState(() => _isLoading = false);
    context.read<AuthCubit>().verifyCode(_controller.text);
    // TODO: router.go('/home');
  }

  void _resendCode() {
    // TODO: authRepository.sendCode(phone)
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              Text(
                'Введите код',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),

              Text(
                'Мы отправили SMS с кодом',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),

              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                autofocus: true,
                maxLength: _codeLength,
                decoration: const InputDecoration(
                  labelText: 'Код из SMS',
                  counterText: '',
                ),
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
                      : const Text('Войти'),
                ),
              ),

              const SizedBox(height: 16),

              Center(
                child: _secondsLeft > 0
                    ? Text(
                        'Отправить код снова через $_secondsLeft сек',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    : TextButton(
                        onPressed: _resendCode,
                        child: const Text('Отправить код снова'),
                      ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}