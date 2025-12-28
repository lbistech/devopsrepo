from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from LbisTech - This is CICD Training using Github Actions! Latest change"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)