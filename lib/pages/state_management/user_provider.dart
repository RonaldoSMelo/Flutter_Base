import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final int age;
  final List<String> hobbies;
  final bool isActive;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.hobbies,
    this.isActive = true,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    int? age,
    List<String>? hobbies,
    bool? isActive,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      hobbies: hobbies ?? this.hobbies,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'hobbies': hobbies,
      'isActive': isActive,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
      hobbies: List<String>.from(json['hobbies']),
      isActive: json['isActive'] ?? true,
    );
  }
}

class UserProvider extends ChangeNotifier {
  User? _currentUser;
  List<User> _users = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  User? get currentUser => _currentUser;
  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasUser => _currentUser != null;
  int get userCount => _users.length;

  // Métodos para modificar o estado
  void setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void clearCurrentUser() {
    _currentUser = null;
    notifyListeners();
  }

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void removeUser(String userId) {
    _users.removeWhere((user) => user.id == userId);
    if (_currentUser?.id == userId) {
      _currentUser = null;
    }
    notifyListeners();
  }

  void updateUser(String userId, User updatedUser) {
    final index = _users.indexWhere((user) => user.id == userId);
    if (index != -1) {
      _users[index] = updatedUser;
      if (_currentUser?.id == userId) {
        _currentUser = updatedUser;
      }
      notifyListeners();
    }
  }

  void toggleUserStatus(String userId) {
    final index = _users.indexWhere((user) => user.id == userId);
    if (index != -1) {
      final user = _users[index];
      _users[index] = user.copyWith(isActive: !user.isActive);
      if (_currentUser?.id == userId) {
        _currentUser = _users[index];
      }
      notifyListeners();
    }
  }

  void addHobbyToUser(String userId, String hobby) {
    final index = _users.indexWhere((user) => user.id == userId);
    if (index != -1) {
      final user = _users[index];
      final newHobbies = List<String>.from(user.hobbies)..add(hobby);
      _users[index] = user.copyWith(hobbies: newHobbies);
      if (_currentUser?.id == userId) {
        _currentUser = _users[index];
      }
      notifyListeners();
    }
  }

  void removeHobbyFromUser(String userId, String hobby) {
    final index = _users.indexWhere((user) => user.id == userId);
    if (index != -1) {
      final user = _users[index];
      final newHobbies = List<String>.from(user.hobbies)..remove(hobby);
      _users[index] = user.copyWith(hobbies: newHobbies);
      if (_currentUser?.id == userId) {
        _currentUser = _users[index];
      }
      notifyListeners();
    }
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  // Simular carregamento de dados
  Future<void> loadUsers() async {
    setLoading(true);
    setError(null);
    
    try {
      // Simular delay de rede
      await Future.delayed(const Duration(seconds: 1));
      
      // Dados de exemplo
      _users = [
        User(
          id: '1',
          name: 'João Silva',
          email: 'joao@email.com',
          age: 25,
          hobbies: ['Futebol', 'Música', 'Viagem'],
        ),
        User(
          id: '2',
          name: 'Maria Santos',
          email: 'maria@email.com',
          age: 30,
          hobbies: ['Leitura', 'Culinária'],
        ),
        User(
          id: '3',
          name: 'Pedro Costa',
          email: 'pedro@email.com',
          age: 28,
          hobbies: ['Programação', 'Jogos', 'Esportes'],
        ),
      ];
      
      if (_users.isNotEmpty) {
        _currentUser = _users.first;
      }
    } catch (e) {
      setError('Erro ao carregar usuários: $e');
    } finally {
      setLoading(false);
    }
  }
}
