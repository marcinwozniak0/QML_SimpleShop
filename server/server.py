from flask import Flask, jsonify, request
import json

app = Flask(__name__)

products = json.load(file('products.json', 'r'))


@app.route('/getProducts', methods = ['GET'])
def get_products():
    return jsonify( {"product" : products["products"]} )


if __name__ == '__main__':
    app.run(debug = True)
