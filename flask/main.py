from flask import Flask
from flask import jsonify
from flaskext.mysql import MySQL
from config import Config


app = Flask(__name__)

app.config.from_object(Config)

mysql = MySQL()
mysql.init_app(app)

@app.route("/message")
def message():
    cursor = mysql.connect().cursor()
    cursor.execute("SELECT message from mytable where 1")
    return jsonify(cursor.fetchone()), 200

if __name__ == "__main__":
    app.run()
