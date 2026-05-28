import '../data/models/user_model.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class RegisterSubmitted extends AuthEvent {
  final UserModel user;
  RegisterSubmitted(this.user);
}

// ✅ Demande d'accès ENCADRANT (validation admin requise)
class DemandeEncadrantSubmitted extends AuthEvent {
  final String nom;
  final String prenom;
  final String email;
  final String password;
  final String telephone;
  final String departement;
  final String specialite;

  DemandeEncadrantSubmitted({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.password,
    required this.telephone,
    required this.departement,
    required this.specialite,
  });
}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;
  LoginSubmitted(this.email, this.password);
}

// ✅ Déconnexion
class LogoutRequested extends AuthEvent {}