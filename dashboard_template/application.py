from flask import Flask, redirect, render_template, request, session, url_for, make_response
from dotenv import load_dotenv
import mysql.connector
import json
import os

app = Flask(__name__, template_folder = './', static_folder='static')

# This loads the .env file which holds our environment variables! You will need to
# create this file on every machine you want to run the app!
load_dotenv('./.env')

cnx = mysql.connector.connect(
    user = os.environ['MYSQL_USERNAME'],
    password = os.environ['MYSQL_PASSWORD'],
    host = os.environ['MYSQL_HOST'],
    database = os.environ['MYSQL_DB']
)



@app.route('/', methods=['POST', 'GET'])
def home():
  return render_template('production/index.html')
  # return render_template('main.html', name = "hello")

@app.route('/predict', methods=['GET'])
def load_pred():
  return render_template("production/form.html")

@app.route('/predicts', methods=['POST'])
def pred_small():
    v1 = float(request.form['s_v1'])
    v2 = float(request.form['s_v2'])

    cursor = cnx.cursor()
    cursor.execute('SELECT co_sm FROM small')
    rows = cursor.fetchall()

    pred_rev =float(rows[0][0]) + v1*float(rows[1][0]) + v2*float(rows[2][0])

    cursor.close()

    return render_template("production/form.html", pred_small=pred_rev)

@app.route('/predictm', methods=['POST'])
def pred_med():
    v1 = float(request.form['m_v1'])

    cursor = cnx.cursor()
    cursor.execute('SELECT co_m FROM medium')
    rows = cursor.fetchall()

    pred_rev =float(rows[0][0]) + v1*float(rows[1][0])

    cursor.close()

    return render_template("production/form.html", pred_med=pred_rev)

@app.route('/predictl', methods=['POST'])
def pred_large():
    v1 = float(request.form['l_v1'])

    cursor = cnx.cursor()
    cursor.execute('SELECT co_l FROM large')
    rows = cursor.fetchall()

    pred_rev =float(rows[0][0]) + v1*float(rows[1][0])

    cursor.close()

    return render_template("production/form.html", pred_large=pred_rev)

# This runs the flask app when 'python application.py' is run. By default,
# we listen on port 8888, if no FLASK_PORT environment variable is set:
if __name__ == '__main__':
    port = os.environ.get('FLASK_PORT') or 8888
    app.run(host='0.0.0.0',port = port)
