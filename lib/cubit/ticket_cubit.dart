import 'package:booking_ticket/db/ticket_db.dart';
import 'package:booking_ticket/model/ticket.dart';
// import 'package:cubit/cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(const TicketState());
  void updateLoadingStatus(LoadingStatus loadingStatus) {
    emit(state.copyWith(loadingStatus: loadingStatus));
  }

  Future<void> loadTickets() async {
    try {
      updateLoadingStatus(LoadingStatus.isLoading);
      final tickets = await DatabaseHelper.getAllTicket();
      emit(state.copyWith(tickets: tickets));
      updateLoadingStatus(LoadingStatus.isLoaded);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      updateLoadingStatus(LoadingStatus.isLoaded);
    }
  }

  Future<int> addTicket(TicketData ticket) async {
    int result = await DatabaseHelper.insertTicket(ticket);

    final tickets = await DatabaseHelper.getAllTicket();
    emit(state.copyWith(tickets: tickets));
    loadTickets();
    return result;
  }

  Future<void> deleteTicket(TicketData ticket) async {
    await DatabaseHelper.deleteTicket(ticket);
    final tickets = await DatabaseHelper.getAllTicket();

    emit(state.copyWith(tickets: tickets));
    loadTickets();
  }

  Future<void> updateTicket(TicketData ticket) async {
    await DatabaseHelper.updateTicket(ticket);
    final tickets = await DatabaseHelper.getAllTicket();

    emit(state.copyWith(tickets: tickets));
    loadTickets();
  }
}
