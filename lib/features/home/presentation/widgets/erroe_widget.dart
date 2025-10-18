// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String? errorMessage;
  const CustomErrorWidget({super.key, this.onPressed, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 60, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            errorMessage ?? 'Failed to load',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onPressed, child: const Text('Retry')),
        ],
      ),
    );
  }
}
