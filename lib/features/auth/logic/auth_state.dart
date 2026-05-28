abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String role;
  final DateTime timestamp; // ← rend chaque état unique

  AuthAuthenticated({required this.role}) : timestamp = DateTime.now();

  @override
  bool operator ==(Object other) => false; // ← toujours différent

  @override
  int get hashCode => timestamp.hashCode;
}

class AuthUnauthenticated extends AuthState {}

class AuthSuccess extends AuthState {}

// ✅ Demande d'accès encadrant envoyée avec succès
class DemandeSubmitted extends AuthState {
  final String message;
  DemandeSubmitted(this.message);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}