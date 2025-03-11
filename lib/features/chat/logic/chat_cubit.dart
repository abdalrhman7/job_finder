import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:JobFinder/core/helper/constants.dart';
import 'package:JobFinder/core/helper/shared_pref_helper.dart';
import 'package:JobFinder/features/chat/data/models/chat_model.dart';
import 'package:JobFinder/features/chat/data/models/send_message_model.dart';
import 'package:JobFinder/features/chat/data/repo/chat_repo.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatRepo) : super(ChatInitial());

  final ChatRepo chatRepo;
  final sendMessageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<ChatModelData> chatList = [];

  void jumpToEnd() {
    scrollController.position.jumpTo(scrollController.position.maxScrollExtent);
  }

  Future<void> getChat([bool? isJumpToEnd]) async {
    emit(ChatLoadingState());
    var result = await chatRepo.getChat({
      'user_id': AppConstants.userId,
      'comp_id': '2',
    });
    result.when(
      success: (chatModel) {
        chatList = chatModel.data!;
        chatList.sort((a, b) => a.id!.compareTo(b.id!));
        if (isJumpToEnd == true) {
          jumpToEnd();
        }
        emit(ChatSuccessState(chatModel.data!));
      },
      failure: (errorMessage) {
        emit(ChatFailureState(
          errorMessage,
        ));
      },
    );
  }

  Future<void> sendMessage() async {
    if(sendMessageController.text.isEmpty) return;
    SendMassageDataModel sendMassageDataModel = SendMassageDataModel(
      massage: sendMessageController.text,
      compId: '2',
      userId: AppConstants.userId,
    );
    sendMessageController.clear();
    var result = await chatRepo.sendMessage(sendMassageDataModel);
    result.when(
      success: (chatModel) {
        getChat(true);
      },
      failure: (errorMessage) {
        emit(ChatFailureState(
          errorMessage,
        ));
      },
    );
  }
}
