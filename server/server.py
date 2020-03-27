from flask import Flask, jsonify, request
import json

app = Flask(__name__)

products = json.load(file('products.json', 'r'))


@app.route('/getProducts', methods = ['GET'])
def get_colors():
    return jsonify( {"product" : colors["products"]} )


if __name__ == '__main__':
    app.run(debug = True)
