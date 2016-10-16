#!/usr/bin/env python
#pylint: disable=C0103

"""
    app.py - webserver for engsoc directorships.
    Coded by: Andrew McBurney
"""

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
def directors():
    """
        List of engsoc directors.
    """
    return render('directors.jade')


@app.route('/directors/<dirname>')
def director_info(dirname):
    """
        Listing for each engsoc director.
    """
    return render('director_name.jade', name=dirname)


if __name__ == "__main__":
    app.run()
