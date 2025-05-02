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
            color: const Color.fromARGB(255, 40, 12, 96).withOpacity(0.4),
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
                    const Center(
                      child: Text('Crie sua conta', textScaleFactor: 1.3),
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
                    const SizedBox(height: 10),
                    CustomTextField(
                      label: 'Nome de usuário',
                      icon: Icons.person,
                      hint: 'Digite seu usuário...',
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'O seu sobrenome não pode ser vazio!';
                        }
                        if (text.length < 5) {
                          return 'O usuário precisa ter mais ${5 - text.length} caracteres.';
                        }
                        return null;
                      },
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
                      'O sistema College+ pede permissão para acessar seus dados básicos de navegação durante o uso da aplicação.',
                      textScaleFactor: 1,
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
