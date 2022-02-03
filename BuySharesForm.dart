import 'package:flutter/material.dart';

class BuySharesForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _quantity;
    String _price;
    String _order;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    Widget _buildQuantity() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Quantity',
        ),
        // ignore: missing_return
        validator: (String value) {
          if (value.isEmpty) {
            return 'Quantity is Required';
          }
        },
        onSaved: (String value) {
          _quantity = value;
        },
      );
    }

    Widget _buildPrice() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Price',
        ),
        // ignore: missing_return
        validator: (String value) {
          if (value.isEmpty) {
            return 'Price is Required';
          }
        },
        onSaved: (String value) {
          _price = value;
        },
      );
    }

    Widget _buildOrder() {
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Buy Shares"),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildQuantity(),
              _buildPrice(),
              // _buildOrder(),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                child: Text(
                  'Buy Shares',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () => {
                  if (!_formKey.currentState.validate()) {},
                  _formKey.currentState.save(),
                  print(_quantity),
                  print(_price),
                  // print(_order),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
