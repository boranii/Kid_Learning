abstract class AppState{}

class AppInitialState extends AppState{}
class AppSuccessState extends AppState{}
class AppErrorState extends AppState
{final String error;AppErrorState(this.error);}

//// Malik's state

class AppLoadingState extends AppState{}

class AppLoadingLetterState extends AppState{}

class AppLoadedLetterState extends AppState{}

class AppMistakeAddedState extends AppState{}