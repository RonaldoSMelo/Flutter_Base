import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/widgets/floating_cart_button.dart';

// Wrapper para páginas individuais que adiciona o carrinho
class PageWrapper extends StatelessWidget {
  final Widget child;

  const PageWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        const Positioned(
          right: 16,
          bottom: 16,
          child: FloatingCartButton(),
        ),
      ],
    );
  }
}
