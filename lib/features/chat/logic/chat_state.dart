part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}


final class ChatLoadingState extends ChatState {}


final class ChatSuccessState extends ChatState {
 final List<ChatModelData> chats ;

  ChatSuccessState(this.chats);
}


final class ChatFailureState extends ChatState {
 final String errorMessage ;

  ChatFailureState(this.errorMessage);
}