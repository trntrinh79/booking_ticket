class TicketData {
  final int? id;
  final String moviename;
  final String datetime;
  final String theater;
  final String seat;
  final String cinema;

  const TicketData({
    required this.moviename,
    required this.datetime,
    required this.theater,
    required this.seat,
    required this.cinema,
    this.id,
  });
  factory TicketData.fromJson(Map<String, dynamic> json) => TicketData(
        id: json['id'],
        moviename: json['moviename'] ?? '',
        datetime: json['datetime'] ?? '',
        theater: json['theater'] ?? '',
        seat: json['seat'] ?? '',
        cinema: json['cinema'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'moviename': moviename,
        'datetime': datetime,
        'theater': theater,
        'seat': seat,
        'cinema': cinema,
      };
}
