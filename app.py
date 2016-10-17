#!/usr/bin/env python
#pylint: disable=C0103

"""
    app.py - webserver for engsoc directorships.
    Coded by: Andrew McBurney
"""

import glob, os
from flask import Flask
from flask import render_template as render

app = Flask(__name__)
app.jinja_env.add_extension('pyjade.ext.jinja.PyJadeExtension')


@app.route('/')
def index():
    """
        Root index for app.
    """
    return render('index.jade')


@app.route('/directors')
def list_directors():
    """
        Renders the list of engsoc directors all EngSoc directors
    """
    return render('directors.jade')


@app.route('/directors/<dirname>')
def show_director(dirname):
    """
        Listing for each engsoc director. Shows things such as name, email,
        directorships they're listed for.
    """
    for file in os.listdir("/static/private/directors"):
        if file.endswith(".txt"):
            print(file)

    return render('director_name.jade', name=dirname)


@app.route('/directorships')
def list_directorships():
    """
        Lists all directorships, and the directors that belong to them.
    """
    return render('directorships.jade')


@app.route('/directorships/<directorship>')
def show_directorship():
    """
        Lists all directorships, and the directors that belong to them.
    """
    return render('directorship.jade', name=directorship)


if __name__ == "__main__":
    app.run()
