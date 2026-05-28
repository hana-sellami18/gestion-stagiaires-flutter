enum StatusCandidature {
  EN_ATTENTE,
  EN_ENTRETIEN,
  VALIDEE_ENCADRANT,
  REFUSEE_ENCADRANT,
  ACCEPTEE,
  REFUSEE
}
class CandidatureModel {
  final int id;
  final int sujetId;
  final String? sujetTitre;
  final int? stagiaireId;          // ← AJOUT
  final String? stagiaireNom;      // ← AJOUT
  final String? stagiairePrenom;   // ← AJOUT
  final String? stagiaireEmail;    // ← AJOUT
  final StatusCandidature statut;
  final DateTime dateDepot;

  CandidatureModel({
    required this.id,
    required this.sujetId,
    this.sujetTitre,
    this.stagiaireId,
    this.stagiaireNom,
    this.stagiairePrenom,
    this.stagiaireEmail,
    required this.statut,
    required this.dateDepot,
  });

  String get stagiaireNomComplet =>
      "${stagiairePrenom ?? ''} ${stagiaireNom ?? ''}".trim();

  factory CandidatureModel.fromJson(Map<String, dynamic> json) {
    final stagiaire = json['stagiaire'] as Map<String, dynamic>?;
    return CandidatureModel(
      id: json['id'],
      sujetId: json['sujet']?['id'] ?? 0,
      sujetTitre: json['sujet']?['titre'],
      stagiaireId: stagiaire?['id'],
      stagiaireNom: stagiaire?['nom'],
      stagiairePrenom: stagiaire?['prenom'],
      stagiaireEmail: stagiaire?['email'],
      statut: StatusCandidature.values.firstWhere(
            (e) => e.name == json['statut'],
        orElse: () => StatusCandidature.EN_ATTENTE,
      ),
      dateDepot: DateTime.parse(json['dateDepot']),
    );
  }
}