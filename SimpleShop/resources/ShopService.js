var PORT = ':5000'
var HTTP = 'http://'

function get_products(response) {
    var httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = function() {
        print('httpRequest: on ready state change: ' + httpRequest.readyState)
        if(httpRequest.readyState === XMLHttpRequest.DONE) {
            if(response) {
                if(201 ===  httpRequest.status){
                    var res = JSON.parse(httpRequest.responseText.toString())
                    response(res);
                }
                currentHttpStatus =  httpRequest.status
            }
            currentHttpStatus =  httpRequest.status;
        }
    }
    httpRequest.open('GET',  HTTP + options.httpEndpointAddress + PORT + '/getProducts');
    httpRequest.setRequestHeader('Content-Type', 'application/json');
    httpRequest.setRequestHeader('Accept', 'application/json');
    httpRequest.send()
}

function send_total_price(request, response) {
    var httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = function() {
        print('httpRequest: on ready state change: ' + httpRequest.readyState)
        if(httpRequest.readyState === XMLHttpRequest.DONE) {
            if(response) {
                if(201 ===  httpRequest.status)
                {
                    var res = JSON.parse(httpRequest.responseText.toString())
                    response(res);
                }
                currentHttpStatus =  httpRequest.status
            }
        }
    }
    httpRequest.open('POST', HTTP + options.httpEndpointAddress + PORT + '/orders');
    httpRequest.setRequestHeader('Content-Type', 'application/json');
    httpRequest.setRequestHeader('Accept', 'application/json');
    var data = request?JSON.stringify(request):''
    httpRequest.send(data)
}
