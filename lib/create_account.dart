import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;
import 'widgets/custom_textfield.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final formKeyCreate = GlobalKey<FormState>();
  bool obscureTextConfirmCreate = true;
  bool checkTermCreate = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 32, 32, 32).withValues(alpha: 0.4),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: formKeyCreate,
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
                      child: Text(
                        'Cadastre-se',
                        textScaler: TextScaler.linear(2.5),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Digite seu nome completo',
                      textScaler: TextScaler.linear(1),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: 'Nome completo',
                      icon: Icons.person,
                      hint: 'Digite seu nome completo...',
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'O seu nome não pode ser vazio!';
                        }
                        if (text.length < 5) {
                          return 'O nome precisa ter mais ${5 - text.length} caracteres.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 10),
                    CustomTextField(
                      label: 'Confirmar e-mail',
                      icon: Icons.email,
                      hint: 'Confirme seu e-mail...',
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
                      obscureText: obscureTextConfirmCreate,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureTextConfirmCreate =
                                !obscureTextConfirmCreate;
                          });
                        },
                        icon: Icon(
                          obscureTextConfirmCreate
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
                    CustomTextField(
                      label: 'Confirmar senha',
                      hint: 'Confirme sua senha...',
                      icon: Icons.vpn_key,
                      obscureText: obscureTextConfirmCreate,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureTextConfirmCreate =
                                !obscureTextConfirmCreate;
                          });
                        },
                        icon: Icon(
                          obscureTextConfirmCreate
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
                    const SizedBox(height: 20),
                    const Text(
                      'O sistema "Guess the number" pede permissão para acessar seus dados básicos de navegação durante o uso da aplicação.',
                      textScaler: TextScaler.linear(0.8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: checkTermCreate,
                          onChanged: (v) {
                            setState(() {
                              checkTermCreate = v!;
                            });
                          },
                        ),
                        const Text('Aceito os termos e condições.'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed:
                            !checkTermCreate
                                ? null
                                : () {
                                  if (formKeyCreate.currentState!.validate()) {
                                    Navigator.pushNamed(context, '/homePage');
                                  }
                                },
                        child: const Text('Confirmar'),
                      ),
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
