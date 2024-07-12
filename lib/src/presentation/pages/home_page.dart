import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          } else if (state is AuthenticationAuthenticated) {
            return Padding(
              padding: EdgeInsets.all(5.w),
              child: UserGreeting(user: state.user),
            );
          } else {
            return const Center(child: Text('Please login'));
          }
        },
      ),
    );
  }
}
