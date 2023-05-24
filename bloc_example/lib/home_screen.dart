import 'package:bloc_example/bloc/authentication_bloc.dart';
import 'package:bloc_example/bloc/authentication_event.dart';
import 'package:bloc_example/bloc/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final TextEditingController emailController = TextEditingController();
    late final TextEditingController passwordController =
    TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(children: [
            TextField(
              maxLength: 100,
              decoration: const InputDecoration(
                counterText: "",
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            TextField(
              maxLength: 24,
              decoration: const InputDecoration(
                counterText: "",
                labelText: 'Password',
              ),
              keyboardType: TextInputType.text,
              controller: passwordController,
            ),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is ErrorState) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(state.error,
                        style: const TextStyle(
                            color: Colors.red
                        ),),
                    );
                  }
                  return Container();
                }, listener: (context, state) {
              if (state is SuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                  elevation: 10,
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(5),
                ));
              }
            }),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context).add(LoginEvent(
                          emailController.text, passwordController.text));
                    },
                    child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        if(state is LoadingState) {
                          return const Center(child: CircularProgressIndicator(color: Colors.white,));
                        } else {
                          return const Text('Login',
                          style: TextStyle(fontSize: 18),);
                        }
                      },
                    )),
              ),
            )
          ]),
        ));
  }
}
