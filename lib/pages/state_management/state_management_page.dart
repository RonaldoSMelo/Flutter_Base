import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';
import 'counter_section.dart';
import 'theme_provider.dart';
import 'theme_section.dart';
import 'user_provider.dart';
import 'user_section.dart';

class StateManagementPage extends StatelessWidget {
  const StateManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const StateManagementView(),
    );
  }
}

class StateManagementView extends StatelessWidget {
  const StateManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'State Management com Provider',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 8,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.withValues(alpha: 0.1),
              Colors.blue.withValues(alpha: 0.05),
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header com explicação
              _buildHeaderCard(),
              const SizedBox(height: 24),

              // Seção 1: Counter Provider
              _buildSectionTitle(
                '1. Counter Provider',
                'Estado Simples com Contador',
                Icons.add_circle_outline,
                Colors.blue,
              ),
              const SizedBox(height: 16),
              const CounterSection(),
              const SizedBox(height: 32),

              // Seção 2: User Provider
              _buildSectionTitle(
                '2. User Provider',
                'Estado Complexo com Lista de Usuários',
                Icons.people_outline,
                Colors.green,
              ),
              const SizedBox(height: 16),
              const UserSection(),
              const SizedBox(height: 32),

              // Seção 3: Theme Provider
              _buildSectionTitle(
                '3. Theme Provider',
                'Gerenciamento de Temas e Cores',
                Icons.palette_outlined,
                Colors.orange,
              ),
              const SizedBox(height: 16),
              const ThemeSection(),
              const SizedBox(height: 32),

              // Seção 4: Explicação do Provider
              _buildSectionTitle(
                '4. Como Funciona o Provider',
                'Conceitos e Benefícios',
                Icons.lightbulb_outline,
                Colors.purple,
              ),
              const SizedBox(height: 16),
              _buildExplanationCard(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple,
            Colors.deepPurple.shade700,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        children: [
          Icon(
            Icons.architecture,
            size: 48,
            color: Colors.white,
          ),
          SizedBox(height: 16),
          Text(
            'Gerenciamento de Estado com Provider',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            'Aprenda como usar o Provider para gerenciar o estado da sua aplicação Flutter de forma eficiente e organizada.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
      String number, String title, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExplanationCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: Colors.deepPurple.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.deepPurple,
                size: 20,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'O Provider é um padrão de gerenciamento de estado que:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildFeatureItem('🔹 Usa ChangeNotifier para notificar mudanças'),
          _buildFeatureItem(
              '🔹 Permite acesso ao estado de qualquer lugar da árvore de widgets',
              maxLines: 2),
          _buildFeatureItem('🔹 Separa a lógica de negócio da interface'),
          _buildFeatureItem('🔹 Facilita testes e manutenção'),
          _buildFeatureItem('🔹 É recomendado pela equipe do Flutter'),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.deepPurple.withValues(alpha: 0.3),
              ),
            ),
            child: const Text(
              '💡 Dica: O Provider é ideal para aplicações pequenas e médias. Para aplicações maiores, considere usar Riverpod ou Bloc.',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text, {int? maxLines}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.4,
              ),
              overflow: maxLines != null ? TextOverflow.ellipsis : null,
              maxLines: maxLines,
            ),
          ),
        ],
      ),
    );
  }
}
