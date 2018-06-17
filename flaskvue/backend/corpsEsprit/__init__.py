from flask import Flask, render_template, jsonify
from random import *
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy

app = Flask('corpsEsprit',
            static_folder="../../dist/static",
            template_folder="../../dist")
cors = CORS(app, resources={r"/api/*": {"origins": "*"}})
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/test.db'
db = SQLAlchemy(app)
