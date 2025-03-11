import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/features/chat/logic/chat_cubit.dart';
import 'package:JobFinder/features/chat/ui/widgets/massage_bubble_widget.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({
    super.key,
  });

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  late var cubit;

  @override
  void initState() {
    cubit = context.read<ChatCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (cubit.chatList.isNotEmpty) {
        cubit..jumpToEnd();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: cubit.scrollController,
      padding: EdgeInsets.symmetric(horizontal: 12),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: MassageBubbleWidget(
            chatModelData: cubit.chatList[index],
          ),
        );
      },
      itemCount: cubit.chatList.length,
    );
  }
}
