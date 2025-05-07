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
            color: const Color.fromARGB(255, 32, 32, 32),
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
                      height: 45,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bem vindo ao:',
                                textScaler: TextScaler.linear(1),
                              ),
                              Text(
                                'Guess The Number!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                                textScaler: TextScaler.linear(1),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text('Login', textScaler: TextScaler.linear(2.5)),
                    ),
                    const SizedBox(height: 40),
                    Text('Digite seu e-mail', textScaler: TextScaler.linear(1)),
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
                    const SizedBox(height: 20),
                    Text('Digite sua senha', textScaler: TextScaler.linear(1)),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 60),
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
                    const SizedBox(height: 40),
                    TextButton(
                      child: const Text('Não tenho conta. Criar conta'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/createAccountPage');
                      },
                    ),
                    const SizedBox(height: 100),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Criado por:', textScaler: TextScaler.linear(0.8)),
                        Text(
                          'Silas Justino, Kadmiel Jorge, Vinicius Machado e Renata Esther',
                          textScaler: TextScaler.linear(0.8),
                        ),
                      ],
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
