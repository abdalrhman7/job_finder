


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/widgets/app_text_form_faild.dart';
import 'package:JobFinder/features/chat/logic/chat_cubit.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ChatCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              hintText: 'Type a message...',
              controller: cubit.sendMessageController,
            ),
          ),
          horizontalSpace(6),
          GestureDetector(
            onTap: () {
              cubit.sendMessage();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14 , vertical: 14),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}