import 'package:chat_app_ui/model/chat_row.dart';
import 'package:flutter/material.dart';

import '../char_row_provider.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (_, position) {
      ChatRow chatRow = ChatRowsProvider.chatRows[position];
      return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            chatRow.profileUrl != null ?
              CircleAvatar(
                backgroundImage: NetworkImage(chatRow.profileUrl),
                radius: 30,
              ):
              CircleAvatar(
                child: Text(chatRow.name.substring(0,2).toUpperCase(), style: TextStyle(
                  fontSize: 20,
                ),),
                radius: 30,
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).accentColor,
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 4,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(child: Text(chatRow.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)),
                        Visibility(
                          visible: chatRow.unreadMessages != 0,
                          child: CircleAvatar(
                            foregroundColor: Colors.white,
                            backgroundColor: Theme.of(context).accentColor,
                            child: Text("${chatRow.unreadMessages}",
                              style: TextStyle(fontSize: 11),
                            ),
                            radius: 9,
                          ),),
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(chatRow.lastMessage,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text(chatRow.timestamp,
                          style: TextStyle(
                            fontSize: 14, color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Divider(color: Colors.grey[500], thickness: 0.3,)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }, itemCount: ChatRowsProvider.chatRows.length,);
  }
}
