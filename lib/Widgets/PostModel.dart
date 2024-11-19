// models/player_model.dart

class PlayerModel {
  final String idTeam;
  final String strTeam;
  final String strLeague;
  final String strBadge;



  PlayerModel({
    required this.idTeam,
    required this.strLeague,
    required this.strTeam,
    required this.strBadge
    
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      idTeam: json['idteam'],
      strTeam: json['strTeam'],
      strLeague: json['strLeague'],
      strBadge: json['strBadge'],
      
    );
  }
}
