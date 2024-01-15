import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_example/using_multi_provider/providers/auth_provider.dart';
import 'package:provider_simple_example/using_multi_provider/providers/count_provider.dart';

void main() {
  runApp(
    MaterialApp(
    home:MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        // Add more providers as needed
      ],
      child: MyHomePage(),
    ),
    )
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiProvider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Access the CounterProvider
            Text('Counter: ${Provider.of<CounterProvider>(context).counter}'),
            ElevatedButton(
              onPressed: () {
                // Increment the counter
                Provider.of<CounterProvider>(context, listen: false).increment();
              },
              child: const Text('Increment Counter'),
            ),
            const SizedBox(height: 20),
            // Access the AuthProvider
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return Text('User is ${authProvider.isLoggedIn ? 'logged in' : 'logged out'}');
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Toggle login/logout
                Provider.of<AuthProvider>(context, listen: false).isLoggedIn
                    ? Provider.of<AuthProvider>(context, listen: false).logout()
                    : Provider.of<AuthProvider>(context, listen: false).login();
              },
              child: const Text('Toggle Login'),
            ),
          ],
        ),
      ),
    );
  }
}
/*
*
* listen: false can be important for performance optimization
*  in cases where you only need to read the current value of the provider
and don't want the widget to rebuild when the provider changes.
 */
