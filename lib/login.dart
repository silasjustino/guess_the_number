import 'package:flutter/material.dart';
import '/widgets/custom_textfield.dart';
import 'package:string_validator/string_validator.dart' as validator;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool obscureTextConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 40, 12, 96).withOpacity(0.4),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    const SizedBox(height: 20),
                    const SizedBox(
                      height: 40,
                      width: 300,
                      child: Text(
                        'Venha conhecer a universidade dos seus sonhos',
                        textScaleFactor: 1.3,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Center(
                      child: Text('Acesse sua conta', textScaleFactor: 1.3),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: 'E-mail',
                      icon: Icons.email,
                      hint: 'Digite seu e-mail...',
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'O e-mail não pode ser vazio!';
                        }
                        if (!validator.isEmail(text)) {
                          return 'Tipo de e-mail não reconhecido!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      label: 'Senha',
                      hint: 'Digite sua senha...',
                      icon: Icons.vpn_key,
                      obscureText: obscureTextConfirm,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureTextConfirm = !obscureTextConfirm;
                          });
                        },
                        icon: Icon(
                          obscureTextConfirm
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        color: Colors.blueAccent,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'A senha não pode ser vazia!';
                        }
                        if (text.length < 5) {
                          return 'A senha precisa ter mais ${5 - text.length} caracteres.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        child: const Text('Entrar'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/homePage');
                          }
                        },
                      ),
                    ),
                    TextButton(
                      child: const Text('Esqueci minha senha'),
                      onPressed: () {},
                    ),
                    Container(height: 1, color: Colors.white),
                    const SizedBox(height: 60),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton.icon(
                        label: const Text('Continuar com o Google'),
                        icon: const Icon(Icons.g_mobiledata),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.5,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      child: const Text('Não tenho conta. Criar conta'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/createAccountPage');
                      },
                    ),
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
