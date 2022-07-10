import 'package:flutter/material.dart';

class UserProductTile extends StatelessWidget {

  final String title;
  final String imageurl;
  UserProductTile({required this.title, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageurl)
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Theme.of(context).primaryColor)),
            IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red))
          ],
        ),
      ),
    );
  }
}
