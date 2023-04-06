// import 'package:booking_ticket/model/ticket.dart';
// import 'package:equatable/equatable.dart';
part of 'ticket_cubit.dart';

class TicketState extends Equatable {
  final List<TicketData>? tickets;
  final String? errorMessage;

  const TicketState({this.tickets, this.errorMessage});

  const TicketState.initial()
      : tickets = null,
        errorMessage = null;

  TicketState copyWith({List<TicketData>? tickets, String? errorMessage}) {
    return TicketState(
      tickets: tickets ?? this.tickets,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [tickets, errorMessage];
}
