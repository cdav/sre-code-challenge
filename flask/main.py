from flask import Flask
from flaskext.mysql import MySQL
from config import Config


mysql = MySQL()
app = Flask(__name__)

app.config.from_object(Config)
app.config.from_envvar('FLASK_ENV_CONF')

mysql.init_app(app)

@app.route("/message")
def message():
    cursor = mysql.connect().cursor()
    cursor.execute("SELECT message from mytable where 1")
    return cursor.fetchone()

if __name__ == "__main__":
    app.run()
