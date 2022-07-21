import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notifications/bloc/joke_bloc.dart';
import 'package:local_notifications/data/repositories/joke_repository.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Joke App'),
      ),
      body: BlocBuilder<JokeBloc, JokeState>(
        builder: (context, state) {
          if (state is JokeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is JokeLoadedState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ExpansionTile(
                    title: Text(
                      state.jokeModel.setup!,
                      textAlign: TextAlign.center,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.jokeModel.delivery!,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<JokeBloc>(context).add(GetJoke());
                    },
                    child: const Text('Load New Joke'),
                  ),
                ],
              ),
            );
          }
          if (state is JokeErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return Container();
        },
      ),
    );
  }
}