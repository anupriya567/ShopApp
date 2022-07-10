# shopApp

A new Flutter project.

## State Management


*   **State management** is a super important topic because it makes sure that your main.dart file in your main
    app here stays clean and you don't rebuild the entire app with every little change that might affect
    some tiny piece in your app.

*   With the provider package, you provide data, like objects here and by the way, that could also be plain strings or
    numbers but here, it's objects and typically, it is objects. 
       > You provide objects here with ChangeNotifierProvider 
          * with value here, with the value constructor 
          * with the create function   

*  Then anywhere in your app, below these providers, so on child widgets here, you can listen to the provided values either with **provider of**,
   like we're doing it here in the orders screen or with **consumer** as we're doing it in the ProductsOverviewScreen, there we're using consumer.

*  The difference between **consumer** and **provider of** was that 
     > With provider of, you rerun the entire build method here, even if you're in a stateless widget, actually that does not matter a bit when you're using
       provider of in there, build reruns whenever this changes, just like as with theme of or media query of, there the build method would also rerun if 
       the data they are connected to changes, it's the same here for the provider.
       
     > With the consumer, it's a bit different. There, you also rerun whenever the data changes but you only rerun the builder function. So consumer
       can be nice if you only want to rebuild a part of a widget tree when something changes instead of the entire widget tree.

 *   We also learned how to have provided data into another provider, like here, product, that also has a ChangeNotifier and we can change the favorite
     status and we manage our product, our product items here in the products class and still we can provide both and tap into both. Together with that, 
     we also learned that we don't just have to provide here in your main widget, you can also provide on a lower level, like in our products grid 
     where we do actually provide our product items here. 
     
     > We can set listen to false in cases where you really only want to get data one time or dispatch an action, like add order where you're not 
       interested in the resulting changes and you only just want to dispatch that, then you can use listen false and also very important,

 *  When wou would use the provider pattern or the provider package and provide values application wide or across multiple widgets at 
    least and when you would stick to stateful widgets, namely you would always use stateful widgets if you only have states that affects this 
    widget only or actually even if it's this widget and maybe a child widget but whenever you don't have state that affects multiple   
    different places in your app that maybe are also distributed quite a bit in the overall widget tree.

