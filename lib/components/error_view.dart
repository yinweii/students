import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  final Function onRetry;

  const ErrorScreen(
      {super.key, required this.errorMessage, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'An error occurred:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          // Text(
          //   errorMessage,
          //   style: const TextStyle(fontSize: 16, color: Colors.red),
          // ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Retry the operation
              onRetry();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
