import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myshop/providers/product.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(id: "", title: "", price: 0, description: "", imageUrl: "");
  @override
  void initState() {
    _imageUrlFocusNode.addListener(updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();

    super.dispose();
  }

  void updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    bool? isValid = false;
    isValid = _form.currentState?.validate();
    if(!isValid!) {
      print("here $isValid");
      return;
    }

    _form.currentState?.save();
    print("details:::");
    print(_editedProduct.title);
    print(_editedProduct.price);
    print(_editedProduct.description);
    print(_editedProduct.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Screen'),
          actions: [
            IconButton(onPressed: _saveForm, icon: Icon(Icons.save)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      title: value!,
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      id: _editedProduct.id,
                      imageUrl: _editedProduct.imageUrl);
                },
                validator: (value) {
                  if(value.isEmpty)
                    return "Please enter your name";
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value) {
                  if(value.isEmpty)
                    return "Please enter the price";
                  if(double.tryParse(value) == null)
                    {
                      return "Please enter a valid number";
                    }
                  if(double.parse(value) <= 0)
                    {
                      return "Please enter a number greater than 0";
                    }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: double.parse(value!),
                      id: _editedProduct.id,
                      imageUrl: _editedProduct.imageUrl);
                },
                focusNode: _priceFocusNode,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if(value.isEmpty)
                    return "Please enter the description";
                  if(value.length < 10) {
                    return "should be atleast 10 chars long";
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      title: _editedProduct.title,
                      description: value!,
                      price: _editedProduct.price,
                      id: _editedProduct.id,
                      imageUrl: _editedProduct.imageUrl);
                },
                focusNode: _descriptionFocusNode,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(_imageUrlController.text),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Image Url',
                      ),
                      controller: _imageUrlController,
                      keyboardType: TextInputType.url,
                      focusNode: _imageUrlFocusNode,
                      textInputAction: TextInputAction.done,
                      onSaved: (value) {
                        _editedProduct = Product(
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            id: _editedProduct.id,
                            imageUrl: value!);
                      },
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                    ),
                  )
                ],
              )
            ],
          )),
        ));
  }
}
