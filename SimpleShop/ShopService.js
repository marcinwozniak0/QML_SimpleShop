var BASE = 'http://localhost:5000/getProducts'

function request(verb, endpoint, obj, response) {
    print('request: ' + verb + ' ' + BASE + (endpoint?'/' + endpoint:''))
    var httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = function() {
        print('httpRequest: on ready state change: ' + httpRequest.readyState)
        if(httpRequest.readyState === XMLHttpRequest.DONE) {
            if(response) {
                var res = JSON.parse(httpRequest.responseText.toString())
                response(res);
            }
        }
    }
    httpRequest.open(verb, BASE + (endpoint?'/' + endpoint:''));
    httpRequest.setRequestHeader('Content-Type', 'application/json');
    httpRequest.setRequestHeader('Accept', 'application/json');
    var data = obj?JSON.stringify(obj):''
    httpRequest.send(data)
}

function get_products(response) {
    request('GET', null, null, response)
}
