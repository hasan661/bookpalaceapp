
import 'package:bookpalace/providers/booksprovider.dart';
import 'package:bookpalace/screens/editproductscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class UserProductItem extends StatelessWidget {
  final imageURL;
  final title;
  final id;
  UserProductItem(this.title, this.imageURL, this.id);
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ListTile(
        leading: Image.network(imageURL),
        title: Text(title),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(onPressed: (){
                Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
              }, icon: Icon(Icons.create), color: Theme.of(context).primaryColor,),
              IconButton(onPressed: (){
                Provider.of<BooksProvider>(context, listen: false).deletebook(id);
              }, icon: Icon(Icons.delete), color: Theme.of(context).errorColor,)
            ],
          ),
        ),
    
      ),
      Divider()]
    );
  }
}