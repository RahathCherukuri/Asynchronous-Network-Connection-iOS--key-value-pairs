Asynchronous-Network-Connection-iOS--key-value-pairs
====================================================

Implements the Asynchronous communication between the server and the app

The app send the key-value pairs to the server and recieves the response from the server.

Functionality:

1. App sends the key, value pairs to the server.
2. Call back method didFailWithError is implemented to look what the error is.
3. Call back methos didReceiveResponse is implemented to look at the status code.
4. Call back method didReceiveData is implemented to collect the data from the server.
5. Call back method connectionDidFinishLoading is implemented to ensure the connection request was successful.
