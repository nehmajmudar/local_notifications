import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notifications/data/models/joke_model.dart';
import 'package:local_notifications/data/repositories/joke_repository.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent,JokeState>{

  JokeBloc() : super(JokeInitial()){
    final JokeRepository _jokeRepository=JokeRepository();

    on<GetJoke>((event, emit) async{
      try{
        emit(JokeLoadingState());
        final jokeResponse=await _jokeRepository.getJokeApi();
        emit(JokeLoadedState(jokeModel: jokeResponse!));
      }catch(e){
        print(e.toString());
        emit(JokeErrorState(error: e.toString()));
      }
    });
  }

  // @override
  // Stream<JokeState?> mapEventToState(JokeEvent event)async*{
  //   if(event is GetJoke){
  //     yield JokeLoadingState();
  //
  //     try{
  //       final jokeResponse=await jokeRepository.getJokeApi();
  //       yield JokeLoadedState(jokeModel: jokeResponse!);
  //     }
  //     catch(e){
  //       print(e.toString());
  //       yield JokeErrorState(error: e.toString());
  //     }
  //   }
  // }
}