#!/bin/bash -x

USER=Alice

grpcurl -plaintext -d "{ \"product_id\": \"pear\", \"quantity\": 2 }" localhost:9001 com.example.inventory.ProductInventory/AddProductQuantity
grpcurl -plaintext -d "{ \"product_id\": \"apple\", \"quantity\": 4 }" localhost:9001 com.example.inventory.ProductInventory/AddProductQuantity
grpcurl -plaintext -d "{ \"product_id\": \"potato\", \"quantity\": 5 }" localhost:9001 com.example.inventory.ProductInventory/AddProductQuantity

grpcurl -plaintext -d "{ \"user_id\": \"$USER\", \"product_id\": \"pear\", \"name\": \"Pear\", \"quantity\": 2 }" localhost:9000 com.example.shoppingcart.ShoppingCart/AddItem
grpcurl -plaintext -d "{ \"user_id\": \"$USER\", \"product_id\": \"potato\", \"name\": \"Potato\", \"quantity\": 1 }" localhost:9000 com.example.shoppingcart.ShoppingCart/AddItem
grpcurl -plaintext -d "{ \"user_id\": \"$USER\", \"product_id\": \"apple\", \"name\": \"Apple\", \"quantity\": 1 }" localhost:9000 com.example.shoppingcart.ShoppingCart/AddItem  
grpcurl -plaintext -d "{ \"user_id\": \"$USER\", \"product_id\": \"apple\", \"name\": \"Apple\", \"quantity\": 2 }" localhost:9000 com.example.shoppingcart.ShoppingCart/AddItem  
# grpcurl -plaintext -d "{ \"user_id\": \"$USER\", \"product_id\": \"potato\", \"name\": \"Potato\", \"quantity\": 10 }" localhost:9000 com.example.shoppingcart.ShoppingCart/AddItem
# grpcurl -plaintext -d "{ \"user_id\": \"$USER\", \"product_id\": \"carrot\", \"name\": \"Carrot\", \"quantity\": 4 }" localhost:9000 com.example.shoppingcart.ShoppingCart/AddItem 

grpcurl -plaintext -d "{ \"user_id\": \"$USER\" }" localhost:9000 com.example.shoppingcart.ShoppingCart/GetCart
grpcurl -plaintext -d "{ \"user_id\": \"$USER\" }" localhost:9002 com.example.shoppingservice.ShoppingService/GetShoppingCart

grpcurl -plaintext -d "{ \"user_id\": \"$USER\" }" localhost:9002 com.example.shoppingservice.ShoppingService/ReserveCartItems
grpcurl -plaintext -d "{ \"user_id\": \"$USER\" }" localhost:9002 com.example.shoppingservice.ShoppingService/CancelOrder                                           

grpcurl -plaintext -d "{ \"user_id\": \"$USER\" }" localhost:9002 com.example.shoppingservice.ShoppingService/GetShoppingCart

grpcurl -plaintext -d "{ \"user_id\": \"$USER\" }" localhost:9002 com.example.shoppingservice.ShoppingService/ReserveCartItems
grpcurl -plaintext -d "{ \"user_id\": \"$USER\" }" localhost:9002 com.example.shoppingservice.ShoppingService/ConfirmOrder   

grpcurl -plaintext -d "{ \"user_id\": \"$USER\" }" localhost:9002 com.example.shoppingservice.ShoppingService/GetShoppingCart
