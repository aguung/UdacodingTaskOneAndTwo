import 'package:app_task/repository/auth_repository.dart';
import 'package:app_task/ui/home/home_view.dart';
import 'package:app_task/ui/register/register_view.dart';
import 'package:app_task/utils/extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_cubit.dart';

class LoginView extends StatelessWidget {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final formState = GlobalKey<FormState>();
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final loginCubit = LoginCubit(
      repository: AuthRepository(
    Dio(),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: BlocProvider<LoginCubit>(
        create: (context) => loginCubit,
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is FailureLoginState) {
              scaffoldState.currentState
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            } else if (state is SuccessLoginState) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('userId', state.user.user.userId);
              prefs.setString('token', state.user.accessToken);
              prefs.setString('name', state.user.user.userName);
              prefs.setString('email', state.user.user.userEmail);

              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeView()));
            }
          },
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints.tightFor(
                  height: MediaQuery.of(context).size.height),
              child: Stack(
                children: [
                  Form(
                    key: formState,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                            child: Image.asset(
                              "images/icon.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: controllerUsername,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              return value.isEmpty
                                  ? 'Email is empty'
                                  : value.isValidEmail()
                                      ? null
                                      : "Check your email";
                            },
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: controllerPassword,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            validator: (value) =>
                                value.isEmpty ? 'Password is empty' : null,
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              child: Text('Login'),
                              textColor: Colors.white,
                              color: Colors.blue,
                              padding: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () {
                                if (formState.currentState.validate()) {
                                  var username = controllerUsername.text.trim();
                                  var password = controllerPassword.text.trim();
                                  loginCubit.login(username, password);
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: <Widget>[
                                Text('Does not have account?'),
                                FlatButton(
                                  textColor: Colors.blue,
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterView()));
                                  },
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                    if (state is LoadingLoginState) {
                      return Container(
                        color: Colors.black.withOpacity(.5),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
