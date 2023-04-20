from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
    lst = ['red', 'green', 'blue']
    print(lst[3])
    dividebyzero = 3/0 
    return 'Welcome to Python Flask World Error Reporting'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
