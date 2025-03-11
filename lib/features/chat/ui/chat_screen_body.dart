import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/features/chat/logic/chat_cubit.dart';
import 'package:JobFinder/features/chat/ui/widgets/chat_list_view.dart';
import 'package:JobFinder/features/chat/ui/widgets/send_message_widget.dart';

import '../../../core/theming/styels.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              var cubit = context.read<ChatCubit>();
              if(cubit.chatList.isNotEmpty){
                return ChatListView();
              }else{
                return  Center(child: Text('No Massage' , style: TextStyles.font14DarkBlueMedium),);
              }
            },
          ),
        ),
        SendMessageWidget(),
        verticalSpace(6),
      ],
    );
  }
}






