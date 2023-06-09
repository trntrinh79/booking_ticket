// import 'package:booking_ticket/model/ticket.dart';
// import 'package:equatable/equatable.dart';
part of 'ticket_cubit.dart';

class TicketState extends Equatable {
  final List<TicketData> tickets;
  final String errorMessage;
  final LoadingStatus loadingStatus;

  const TicketState(
      {this.loadingStatus = LoadingStatus.isLoaded,
      this.tickets = const [],
      this.errorMessage = ''});

  // const TicketState.initial()
  //     : tickets = null,
  //       errorMessage = null;

  TicketState copyWith({
    List<TicketData>? tickets,
    String? errorMessage,
    LoadingStatus? loadingStatus,
  }) {
    return TicketState(
      tickets: tickets ?? this.tickets,
      errorMessage: errorMessage ?? this.errorMessage,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [tickets, errorMessage, loadingStatus];
}

enum LoadingStatus {
  isLoading,
  isLoaded,
}
