import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubitCubit extends Cubit<NotesState> {
  NotesCubitCubit() : super(NotesInitial());
}
