#!/usr/bin/env python
#pylint: disable=C0103

"""
    EngSoc Directorships - webserver for engsoc directorship listings.
    Coded by: Andrew McBurney (VP Academic 'B'-Society)
"""

import os
from flask import Flask
from flask import render_template as render

app = Flask(__name__)
app.jinja_env.add_extension('pyjade.ext.jinja.PyJadeExtension')


@app.route('/')
def index():
    """
        Root index for app.
    """
    return render('index.jade', title='EngSoc Directorships')


@app.route('/directors')
def list_directors():
    """
        Renders the list of engsoc directors all EngSoc directors
    """
    return render('directors.jade', title='List of EngSoc Directors')


@app.route('/directors/<dirname>')
def show_director(dirname):
    """
        Listing for each engsoc director. Shows things such as name, email,
        directorships they're listed for.
    """
    for file_name in os.listdir("/static/private/directors"):
        if file_name.endswith(".txt"):
            print file_name

    return render('director_name.jade', title='EngSoc Director - ' + dirname,
                  name=dirname)


@app.route('/directorships')
def list_directorships():
    """
        Lists all directorships, and the directors that belong to them.
    """
    return render('directorships.jade', title='List of EngSoc Directorships')


@app.route('/directorships/<directorship>')
def show_directorship(directorship):
    """
        Lists all directorships, and the directors that belong to them.
    """
    return render('directorship.jade', title='EngSoc Directorship - ' +
                  directorship, name=directorship)


if __name__ == "__main__":
    app.run()
