import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  Color? noteColor;

  addNote(NoteModel note) async {
    emit(AddNoteLoading());

    note.color = noteColor!.value;

    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      try {
        await noteBox.add(note);
      } catch (e) {
        print('error adding note to database $e');
      }
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
