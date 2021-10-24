from flask import Flask
application = Flask(__name__)

@application.route("/")
def index():
    return "Your Flask App Works!"

@application.route("/hello")
def hello():
    return "Hello World!"

# 5000 ok?
if __name__ == "__main__":
    application.run(port=5000, debug=True)