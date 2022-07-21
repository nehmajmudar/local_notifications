part of 'joke_bloc.dart';

abstract class JokeState{}

class JokeInitial extends JokeState{}

class JokeLoadingState extends JokeState{}

class JokeLoadedState extends JokeState{
  final JokeModel jokeModel;

  JokeLoadedState({required this.jokeModel});
}

class JokeErrorState extends JokeState{
  final String error;

  JokeErrorState({required this.error});
}