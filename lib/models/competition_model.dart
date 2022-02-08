

// ignore_for_file: prefer_if_null_operators

class Matches {
  int count;
  Filters filters;
  Competition competition;
  List<Match> matches;

  Matches({this.count, this.competition, this.filters, this.matches});

  factory Matches.fromJson(Map<String, dynamic> json) {
    return Matches(
      // Fixture.fromJson(json['fixture']),
      competition: Competition.fromJson(json['competition']),
      matches: List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
    );
  }
}

class Match {
  int id;
  Team homeTeam;
  Team awayTeam;

  Match({this.id, this.homeTeam, this.awayTeam});

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
        id: json["id"],
        homeTeam: Team.fromJson(json['homeTeam']),
        awayTeam: Team.fromJson(json['awayTeam']));
  }
}

class Team {
  int id;
  String name;

  Team({this.id, this.name});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"],
      name: json["name"],
    );
  }
}

class Competition {
  Competition({
    this.id,
    this.area,
    this.name,
    // this.code,
    // this.lastUpdated,
  });

  int id;
  Area area;
  String name;
 

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        area: Area.fromJson(json["area"]),
        name: json["name"],
   
      );


}

class Area {
  Area({
    this.id,
    this.name,
  
  });

  int id;
  String name;


  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
       
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      
      };
}

class CurrentSeason {
  CurrentSeason({
    this.id,
    this.startDate,
    this.endDate,
    this.currentMatchday,
   
  });

  int id;
  DateTime startDate;
  DateTime endDate;
  int currentMatchday;
  // Winner winner;

  factory CurrentSeason.fromJson(Map<String, dynamic> json) => CurrentSeason(
        id: json["id"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        currentMatchday:
            json["currentMatchday"] == null ? null : json["currentMatchday"],
 
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "currentMatchday": currentMatchday == null ? null : currentMatchday,
      
      };
}


class Filters {
  Filters();

  factory Filters.fromJson(Map<String, dynamic> json) => Filters();

  Map<String, dynamic> toJson() => {};
}

