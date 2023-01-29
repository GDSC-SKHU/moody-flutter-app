class Moodys {
  String? userName;
  String? saying;
  List<Heatmap>? heatmap;

  Moodys({this.userName, this.saying, this.heatmap});

  Moodys.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    saying = json['saying'];
    if (json['heatmap'] != null) {
      heatmap = <Heatmap>[];
      json['heatmap'].forEach((v) {
        heatmap!.add(new Heatmap.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['saying'] = this.saying;
    if (this.heatmap != null) {
      data['heatmap'] = this.heatmap?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Heatmap {
  String? year;
  String? month;
  String? day;
  int? feeling;

  Heatmap({this.year, this.month, this.day, this.feeling});

  Heatmap.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
    feeling = json['feeling'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['day'] = this.day;
    data['feeling'] = this.feeling;
    return data;
  }
}
