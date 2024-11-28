import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayLoadingIndicator extends StatelessWidget {
  final bool isLoading;

  const OverlayLoadingIndicator(
    this.isLoading, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: Positioned.fill(
        child: Container(
          color: Colors.black54,
          child: const LoadingIndicator(),
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : const CupertinoActivityIndicator(
              radius: 16,
              color: Colors.white,
            ),
    );
  }
}
