import 'package:bookpalace/providers/books.dart';
import 'package:bookpalace/providers/booksprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  static const routeName = "/edit";

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _imageURLcontroller = TextEditingController();
  final _imageURLfocusnode = FocusNode();
  var initvalues = {
    "title": "",
    "authorName": "",
    "price": 0,
    "content": "",
    "imageURL": ""
  };
  var _editedproducts = Books(
      imageURL: "", authorName: "", content: "", id: "", price: 0, title: "");
  void _saveform() {
    final validity = _formKey.currentState!.validate();
    if (!validity) {
      return;
    }
    _formKey.currentState!.save();
    if(_editedproducts.id!="")
    {
      Provider.of<BooksProvider>(context, listen: false).updatebooks(_editedproducts.id, _editedproducts);
      Navigator.of(context).pop();
    }
    
    else{
      Provider.of<BooksProvider>(context, listen: false)
        .addbooks(_editedproducts);
        Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _imageURLfocusnode.removeListener(_imageurlfocus);
    _imageURLfocusnode.dispose();
    _imageURLcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _imageURLfocusnode.addListener(_imageurlfocus);
    super.initState();
  }

  void _imageurlfocus() {
    if (_imageURLfocusnode.hasFocus) {
    } else {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    final bookid = ModalRoute.of(context)!.settings.arguments;
    if (bookid != null) {
      _editedproducts =
          Provider.of<BooksProvider>(context, listen: false).filterbyid(bookid);
      initvalues = {
        "title": _editedproducts.title,
        "authorName": _editedproducts.authorName,
        "price": _editedproducts.price,
        "content": _editedproducts.content,
        "imageURL": ""
      };
      _imageURLcontroller.text = _editedproducts.imageURL;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit/Add Product"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: initvalues['title'].toString(),
                      onSaved: (val) => _editedproducts = Books(
                        imageURL: _editedproducts.imageURL,
                        authorName: _editedproducts.authorName,
                        content: _editedproducts.content,
                        id: _editedproducts.id,
                        price: _editedproducts.price,
                        title: val.toString(),
                      ),
                      validator: (title) {
                        if (title == "") {
                          return "Please Enter A Value";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(labelText: "title"),
                      textInputAction: TextInputAction.next,
                    ),
                    TextFormField(
                      initialValue: initvalues['authorName'].toString(),
                      onSaved: (val) => _editedproducts = Books(
                        imageURL: _editedproducts.imageURL,
                        authorName: val.toString(),
                        content: _editedproducts.content,
                        id: _editedproducts.id,
                        price: _editedproducts.price,
                        title: _editedproducts.title,
                      ),
                      validator: (authorname) {
                        if (authorname == "") {
                          return "Please Specify The Author Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(labelText: "author name"),
                      textInputAction: TextInputAction.next,
                    ),
                    TextFormField(
                      initialValue: initvalues['price'].toString(),
                      onSaved: (val) => _editedproducts = Books(
                          imageURL: _editedproducts.imageURL,
                          authorName: _editedproducts.authorName,
                          content: _editedproducts.content,
                          id: _editedproducts.id,
                          price: double.parse(
                            val.toString(),
                          ),
                          title: _editedproducts.title),
                      decoration: InputDecoration(labelText: "price"),
                      keyboardType: TextInputType.number,
                      validator: (price) {
                        if (price == 0) {
                          return "Please Specify Price";
                        }
                        if (double.tryParse(price!) == null) {
                          return "Please Enter A NUMBER Here";
                        }
                        if (double.parse(price) < 0) {
                          return "Please enter a valid number";
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    TextFormField(
                      initialValue: initvalues['content'].toString(),
                      onSaved: (val) => _editedproducts = Books(
                          imageURL: _editedproducts.imageURL,
                          authorName: _editedproducts.authorName,
                          content: val.toString(),
                          id: _editedproducts.id,
                          price: _editedproducts.price,
                          title: _editedproducts.title),
                      decoration: InputDecoration(labelText: "content"),
                      textInputAction: TextInputAction.next,
                      validator: (content) {
                        if (content == "") {
                          return "Please Enter A Value";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 8),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: _imageURLcontroller.text.isEmpty
                              ? Center(
                                  child: Text("Enter A Url"),
                                )
                              : Image.network(_imageURLcontroller.text),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          // initialValue: initvalues['imageURL'].toString(),
                          decoration: InputDecoration(
                            labelText: "Image URL",
                          ),
                          textInputAction: TextInputAction.done,
                          controller: _imageURLcontroller,
                          onSaved: (val) => _editedproducts = Books(
                              imageURL: val.toString(),
                              authorName: _editedproducts.authorName,
                              content: _editedproducts.content,
                              id: _editedproducts.id,
                              price: _editedproducts.price,
                              title: _editedproducts.title),
                          onFieldSubmitted: (_) {
                            _saveform();
                          },
                          focusNode: _imageURLfocusnode,
                          validator: (imageurl) {
                            if (imageurl == "") {
                              return "Enter the url";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ]),
                  ],
                ),
              )),
        ));
  }
}
