from flask import Flask, jsonify, request
import json

app = Flask(__name__)

products = json.load(file('products.json', 'r'))

@app.route('/getProducts', methods = ['GET'])
def get_products():
    return jsonify( products)

@app.route('/orders', methods= ['POST'])
def acceptr_order():
    totalPrice = request.json['price']
    totalPriceWithTaxes = int(totalPrice) * 1.23
    return jsonify(int(totalPriceWithTaxes)), 201

if __name__ == '__main__':
    app.run(debug = True)
