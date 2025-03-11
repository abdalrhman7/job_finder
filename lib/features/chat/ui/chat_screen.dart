import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/di/dependancy_injection.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/features/chat/data/repo/chat_repo.dart';
import 'package:JobFinder/features/chat/logic/chat_cubit.dart';

import 'package:flutter/material.dart';
import 'package:JobFinder/features/chat/ui/chat_screen_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('JobFinder', style: TextStyles.font18DarkBlueBold,),
        backgroundColor: Colors.white,
      ),
      body: BlocProvider(
        create: (context) => ChatCubit(getIt<ChatRepo>())..getChat(),
        child: ChatScreenBody(),
      ),
    );
  }
}

