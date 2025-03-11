


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/features/chat/data/models/chat_model.dart';

class MassageBubbleWidget extends StatelessWidget {
  const MassageBubbleWidget({super.key, required this.chatModelData});

  final ChatModelData chatModelData;

  @override
  Widget build(BuildContext context) {
    var  isCompany = chatModelData.senderUser == 'company';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment:  isCompany ? Alignment.centerLeft : Alignment.centerRight,
          child: Column(
            crossAxisAlignment: isCompany ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  chatModelData.massage ?? '',
                  style: TextStyles.font14DarkBlueMedium,
                ),
                decoration: BoxDecoration(
                  color: isCompany ? Colors.grey.shade300 : Colors.blue.shade300,
                  borderRadius: BorderRadius.only(
                    topRight: isCompany ? Radius.circular(12) : Radius.circular(0),
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    topLeft:  isCompany ? Radius.circular(0) : Radius.circular(12),
                  ),
                ),
              ),
              Text(
                DateFormat.jm()
                    .format(DateTime.parse(chatModelData.createdAt.toString())),
                style: TextStyles.font12GrayRegular,

              ),
            ],
          ),
        ),

      ],
    );
  }
}