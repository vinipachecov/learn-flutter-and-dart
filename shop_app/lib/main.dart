import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_overview_screen.dart';
import 'package:shop_app/screens/user_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            update: (ctx, auth, previousProducts) => Products(auth.token,
                previousProducts == null ? [] : previousProducts.items),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Cart(),
          ),
          ChangeNotifierProvider(create: (ctx) => Orders())
        ],
        child: Consumer<Auth>(
            builder: (ctx, authData, _) => MaterialApp(
                  title: 'MyShop',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                    accentColor: Colors.deepOrange,
                    fontFamily: 'Lato',
                  ),
                  home:
                      authData.isAuth ? ProductsOverviewScreen() : AuthScreen(),
                  routes: {
                    ProductDetailScreen.routeName: (ctx) =>
                        ProductDetailScreen(),
                    CartScreen.routeName: (ctx) => CartScreen(),
                    OrdersScreen.routeName: (ctx) => OrdersScreen(),
                    UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
                    EditProductScreen.routeName: (ctx) => EditProductScreen()
                  },
                )));
  }
}
