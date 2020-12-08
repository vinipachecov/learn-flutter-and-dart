# Flutter introduction

- [About the dart language](#about-the-dart-language)
- [Minimal Hello world in Flutter](#minimal-hello-world-in-flutter)
- [Flutter Styling](#flutter-styling)
  -[Element Alignment](#element-alignment)
- [TextEditingControllers](#TextEditingControllers)
- [Theming](#Theming)
- [Fonts and Images](#fonts-and-images)
- [Components](#Components)
  - [FittedBox](#FittedBox)
  - [Padding](#Padding)
  - [Flexible](#Flexible)
- [Flexfit](#Flexfit)
- [Scaling and Responsive Layouts](scaling-and-Responsive-Layouts)
  - [MediaQuery](#MediaQuery)
  - [Layout Builder](#Layout-Builder)
- [Trees in Flutter](#Trees-in-Flutter)
  - [Widget Tree](#Widget-Tree)
  - [Render Tree](#Render-Tree)
- [Navigation](#Navigation)
- [Provider and ChangeNotifier](#Provider-and-ChangeNotifier)
  - [The ChangeNotifier class](#The-ChangeNotifier-class)
  - [Partial re-rendering with Consumer](#Partial-re-rendering-with-Consumer)

Basics about flutter

Flutter is an extremelly powerfull language, it is a compiled language so it compiles code directly to machine code, making it extremelly fast.


## About the dart language

Dart is:

- Strogly type: requires variable types to work properly.
- Has type inference: Dart can infer the type of a varible according to its assigned value.
- Is Object Oriented

A small code in dart would be:

```dart
int addNumbers(int num1, int num2) {
  return num1 + num2;
}

void main() {
  var result = addNumbers(1,5);
  print(result);
}
```

## Minimal Hello world in Flutter
Start a new project with **flutter create app_name**

So a minimal example in Flutter would be just something printed on the screen:

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: Text('Hello World'));
  }
}
```

The first line, the "import" is where we get the flutter sdk and its classes and functions to help building our app.
For minimal code we need:

- A file main.dart in lib
- main function in the file with runApp() function
- A class that extends one of the Widget classes
- The class that extends one of the widget classes should implement the build method returning a widget at least or a widget tree.

## Flutter Styling

To add Styles in Flutter we have various options:

1. Container: we use BoxDecoration
2. Text Elemnet: we use TextStyle

We both classes combined we can achieve most of the styling we need. In other words, with this we can style container boxes and text elements.

## Element Alignment

Just like in normal CSS flexbox, in flutter we have CrossAxisAlignment and MainAxisAlignment.
As we have Columns and Rows, the behavior of this properties will be:

|                    | Columns                                                                                   | Rows                                                                                           |
| ------------------ | ----------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| CrossAxisAlignment | What crosses a column, so it is a horizontal alignment                                    | What crosses a row or what I like to think a horizontal line. This means it aligns vertically. |
| MainAxisAlignment  | The main flow of columns, i.e placing items vertically one below each other like a stack. | The main flow of row, i.e placing items horizontally.                                          |

## TextEditingControllers

TextEditingControllers are a convinient way of having a variable been controlled by a stateless component that will be changed but doesn't effect the overall state of the app.
Not only is an elegant way but Flutter preffer this style.

```dart
  final titleController = TextEditingController();
```

```dart
  TextField(
    decoration: InputDecoration(labelText: 'Amount'),
    controller: amountController,
  ),
```

## Theming

Flutter gives us an Api for creating an Theme of colors inside our app. Inside our MaterialApp object we can have a theme property that we can config to have different styles for our app globally.

```dart
return MaterialApp(
      title: 'Expenses App',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(fontFamily: 'OpenSans', fontSize: 20)))),
    );
```

## Fonts and Images

To add static assets to Flutter apps is quite easy, first create a folder for it and then inside pubspec.yaml there are instructions on how to insert those fonts:

```yaml
flutter:
  fonts:
    - family: OpenSans
      fonts:
        - asset: assets/fonts/OpenSans-Regular.ttf
        - asset: assets/fonts/OpenSans-bold.ttf
          weight: 700
    - family: Quicksand
      fonts:
        - asset: assets/fonts/Quicksand-Light.ttf
          weight: 300
        - asset: assets/fonts/Quicksand-Regular.ttf
          weight: 400
        - asset: assets/fonts/Quicksand-Medium.ttf
          weight: 500
        - asset: assets/fonts/Quicksand-Bold.ttf
          weight: 700
```

The same works for images:

```yaml
assets:
  - assets/images/waiting.png
```

## Components

#### FittedBox

Wrap child to its original size and not allow it to grow.

#### Padding

A Component that used to only set Padding to it wrapped child.

#### Flexible

Flexible is a wrapper to set its child growing space strategy.
It uses the Flexfit API to set its behaviors

## Flexfit

When using the Flexfit API there is the options:

- tight: uses all available space
- loose: uses only space needed to fit the component

It works similar to flexbox css.

## Scaling and Responsive Layouts

To have more responsive layouts we can use MediaQueries and LayoutBuilder component.

### MediaQuery

The media query has access to height, padding and other variables to give a more responsive layout to our components.

### Layout Builder

Layout builder helps us to give access to device constraints inside a component based on the device screen size.


## Trees in Flutter

in Flutter there are 3 Trees that we must know: Widget Tree, Element Tree, Render Tree.

### Widget Tree
Is the current tree with all widgets currently rendered.

### Element Tree
Replica of the Widget Tree but with the state of widgets.

### Render Tree
What is actually been seen in the App.

## Navigation

Navigation is a key feature in mobile apps. In Flutter we can use at least 2 methods with the Navigator class:

- Navigator.of(context).push:
```dart
  // MaterialPageRoute for Android animations and CupertinoPageRoute for IOS
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    // returning the name of our design
       return CategoryMealsScreen(this.id, this.title);
  }, ));
```
- Navigator.of(context).pushNamed:
```dart
    // navigation using string named routes
    Navigator.of(ctx).pushNamed('/category-meals', arguments: {
      'id': id,
      'title': title
    });
```

When there is a chance you already pushed a route, i.e in a Drawer or similar menus, you can use "pushReplacementNamed" :

```dart
    // navigation using string named routes
    Navigator.of(ctx).pushReplacementNamed('/route-name', arguments: {
      'id': id,
      'title': title
    });
```

A full example of a drawer in the shop_app:

```dart
import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Hello Friend!"),
            // add no back button
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

```

To return to the previous route, one can use the pop method, also provided by the Navigator class:
```dart
  Navigator.of(context).pop();
```
This will remove the latest widget "screen" in the stack and move backwards.


### Getting params from navigation

Let's say you were supposed to receive data through navigation, i.e like an id.
MediaRoute is a class that through the use of context can give access to a "screen" settings.arguments which is where
the data should be.
The way to attempt to get this data is:
```dart
  final mealId = ModalRoute.of(context).settings.arguments as String;
```

## Provider and ChangeNotifier

In most apps we need ways of providing access to data across diferent screens/widgets in our app. For instance, user data might be used across the whole app to identify possible requests or render user information to clearly identify who is using or something simliar.
The Provider package provides a set of classes designed to help us in the accessibility of such information across widgets.

<i>A class that extends Providers features is a class where it's data is somewhat required and used across the app.</i>

Instead of directly returning the MaterialApp in our root file, we will require the usage of a "high order widget" that will wrap the MaterialApp widget and provides the basic setup for the usage of the Provider features:
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Products(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Cart(),
          ),
          ChangeNotifierProvider(create: (ctx) => Orders())
        ],
        child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen()
          },
        ));
  }
}
```

### The ChangeNotifier class
In this basic example, a simple abstraction of a shop app, MyApp widget returns a MultiProvider, which is a class used when we have multiple providers. Such Providers are stated in the providers array property, where every class that propagates data will be wrapped in a
<strong>ChangeNotifierProvier</strong> class. Moreover, <i>the create property of this class</i> will receive an anonymous function with a context in its arguments and should return a class that we expect to listen it's changes.


```dart
  providers: [
            ChangeNotifierProvider(
              create: (ctx) => Products(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => Cart(),
            ),
            ChangeNotifierProvider(create: (ctx) => Orders())
          ],
```

All of the instantied classes we want to listen, will use the "with" special keyword with ChangeNotifier class from foundation package. This will hook the features we want from the ChangeNotifier.

```dart
class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> carProducts, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: DateTime.now(),
            products: carProducts));
  }
}
```

Now we are able to access data from this class and its methods across any widget we want, only by using the following code:
```dart
  final ordersData = Provider.of<Orders>(context);
```

That is all. By using the Provider class from the provider package we are listening to the changes and rebuilding our widget when it changes, giving the possibility to render updated data.

### Partial re-rendering with Consumer
This gives a powerful tool to access data and even programatically choose when something should re-render. By using the Consumer class, also from foundation.dart, we can wrap piece of code in our widget to re-render when a class hooked with ChangeNotifier receives changes.
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(product.imageUrl, fit: BoxFit.cover)),
        footer: GridTileBar(
          // Area that re-runs
          leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                  // needs data to check if it is favorite or not
                  icon: Icon(product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    product.toggleFavoriteStatus();
                  })),
          trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('added item to cart!'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        cart.removeSingeItem(product.id);
                      }),
                ));
              }),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

```

In Consumer class gets a class which he will infer the data, and when instantiated will provide a builder prop that receives a method with:
context, data_listened and child component.

## Forms

In Flutter, to properly handle forms we can use the Form widget from the material.dart package.
It helps with most of the validation, error messages, customization and more.
Forms will be used along with TextFormField, which is the component to render the text inputs.

### About scroll using Form
The Form widget receives only a single child, therefore if we need scroll capability we might
want to use a SingleChildScrollView with a Column to enable an adequate render. The reason behing this is because if we use
ListView, the rendering of the child components that are out of screen might result in some flickering or bugs during scroll.


```dart
Form(
        key: _form,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Title"),
              // appearance of the submit button in the keyboard
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                // Ensure price textfield is focused
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              onSaved: (value) {
                _editedProduct = Product(
                    title: value,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    id: null,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide a value.';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Price"),
              focusNode: _priceFocusNode,
              // appearance of the submit button in the keyboard
              onFieldSubmitted: (_) {
                // Ensure price textfield is focused
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _editedProduct = Product(
                    title: _editedProduct.title,
                    price: double.parse(value),
                    description: _editedProduct.description,
                    id: null,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Description"),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              focusNode: _descriptionFocusNode,
              onSaved: (value) {
                _editedProduct = Product(
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: value,
                    id: null,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite);
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter a URL')
                        : FittedBox(
                            child: Image.network(_imageUrlController.text),
                            fit: BoxFit.cover,
                          )),
                Expanded(
                  child: TextFormField(
                    focusNode: _imageUrlFocusNode,
                    decoration: InputDecoration(labelText: 'Image URL'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: _imageUrlController,
                    onSaved: (value) {
                      _editedProduct = Product(
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          description: _editedProduct.description,
                          id: null,
                          imageUrl: value,
                          isFavorite: _editedProduct.isFavorite);
                    },
                    onEditingComplete: () {
                      setState(() {});
                    },
                    onFieldSubmitted: (_) {
                      _saveForm();
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
```

#### TextFormField

This is an example of the widget:

```dart
  TextFormField(
    decoration: InputDecoration(labelText: "Title"),
    // appearance of the submit button in the keyboard
    textInputAction: TextInputAction.next,
    onFieldSubmitted: (_) {
      // Ensure price textfield is focused
      FocusScope.of(context).requestFocus(_priceFocusNode);
    },
    onSaved: (value) {
      _editedProduct = Product(
          title: value,
          price: _editedProduct.price,
          description: _editedProduct.description,
          id: null,
          imageUrl: _editedProduct.imageUrl,
          isFavorite: _editedProduct.isFavorite);
    },
    validator: (value) {
      if (value.isEmpty) {
        return 'Please provide a value.';
      }
      return null;
    },
  ),
```

onFieldSubmitted: function to handle behavior after user submits the field
onSaved: function triggered when the form status is saved, which we will hook the value from the input and send it the form state.
validator: function that expects logic to validate the filed input. When return <strong>null</strong> the widget understands it is valid data.


#### FocusNodes

Its a common UX experience to allow users to jump from one text input to the next one. To address such requirement we can use the FocusNode class available in the material.dart package.

First we instantiate the FocusNode in a state variable for our widget:
```dart
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
```

Then, after in the submit propert of our input we will triger the FocusScope class and request the focus to the next input:

```dart
 TextFormField(
  decoration: InputDecoration(labelText: "Title"),
  // appearance of the submit button in the keyboard
  textInputAction: TextInputAction.next,
  onFieldSubmitted: (_) {
    // Ensure price textfield is focused
    FocusScope.of(context).requestFocus(_priceFocusNode);
  },
  //.,...... rest of the component
  TextFormField(
    decoration: InputDecoration(labelText: "Price"),
    focusNode: _priceFocusNode,
    // appearance of the submit button in the keyboard
    onFieldSubmitted: (_) {
      // Ensure price textfield is focused
      FocusScope.of(context).requestFocus(_descriptionFocusNode);
    },
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.number,
    //..... rest of the component
```

## Animations
Animations are an important part of how mobile apps provides smooth experiences in the UI.
### Manually animating
Flutter provides as a set of classes to help us doing animations manually:

- AnimationController: class that responsible for a specific animation
- Animation: Class that receive a <Type> which the values will change.
- Tween: helper Class that when instantiated receives the same Animation class type and set
    - begin: <Type> used and the value range
    - end: <Type> used and the value range
    - animate (method): when called expects an animation curve(linear, easeIn, easeOut etc...) which receives a
      CurvedAnimation class. CurvedAnimation receives 2 props:
        - parent: AnimationController instance
        - curve: A curve that can be found in the Curves helper class, e.g Curves.linear.

For the animation take effect(at least when doing it manually) we require to rebuild the widget, i.e calling setState directly or indirectly. In the example below, it was set an listener when the widget calls its initState hook.

Moreover, to actually start the animations, the controller.forward() and controller.reverse() must be called to actually dispatch the animations.

```dart
class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();
  AnimationController _controller;
  Animation<Size> _heightAnimation;

  @override
  void initState() {
    _controller = new AnimationController(
        vsync: this, duration: Duration(microseconds: 300));

    _heightAnimation = Tween<Size>(
            begin: Size(double.infinity, 260), end: Size(double.infinity, 320))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _heightAnimation.addListener(() {
      setState(() {});
    });
    super.initState();
  }
  //.....

// Animations triggers HERE
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      // Start the animation
      _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      // revert the animation
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        // height: _authMode == AuthMode.Signup ? 320 : 260,
        height: _heightAnimation.value.height,
        constraints: BoxConstraints(minHeight: _heightAnimation.value.height),
        width: deviceSize.width * 0.75,
```


