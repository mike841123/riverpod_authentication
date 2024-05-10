import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll/component/custom_text_field.dart';
import 'package:infinite_scroll/config/routes/routes_location.dart';
import 'package:infinite_scroll/pages/login/providers/login_provider.dart';
import 'package:infinite_scroll/pages/login/providers/random_provider.dart';
import 'package:infinite_scroll/pages/login/state/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _captchaController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _pwdController.dispose();
    _captchaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(hintText: "請輸入帳號", title: "帳號", width: 260, controller: _usernameController),
              const Gap(20),
              CustomTextField(hintText: "請輸入密碼", title: "密碼", width: 260, controller: _pwdController),
              const Gap(20),
              Consumer(
                builder: (context, ref, child) {
                  final randomState = ref.watch(randomProvider);
                  return SizedBox(
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("驗證碼"),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomTextField(
                              hintText: "請輸入驗證碼",
                              title: "",
                              width: 172,
                              controller: _captchaController,
                            ),
                            const Gap(10),
                            SizedBox(
                              width: 72,
                              child: InkWell(
                                onTap: () {
                                  ref.read(randomProvider.notifier).getRandomCaptcha();
                                },
                                child: Image.network(
                                  'https://pike-ts.mxkjtw.com/baseApi/public/code?randomStr=$randomState',
                                  fit: BoxFit.fill,
                                  height: 40,
                                  gaplessPlayback: true,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Gap(20),
              Consumer(builder: (context, ref, child) {
                final loginState = ref.watch(loginProvider);
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: loginState is LoginStateLoading
                            ? null
                            : () {
                                ref.read(loginProvider.notifier).login(_usernameController.text, _pwdController.text, _captchaController.text, () {
                                  context.go(RouteLocation.home);
                                });
                              },
                        child: const Text("Log in"),
                      ),
                    ),
                    if (loginState is LoginStateLoading) const CircularProgressIndicator(), // 加載指示器
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
