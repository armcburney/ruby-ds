#!/usr/bin/env python
#pylint: disable=C0103

"""
    app.py - webserver for engsoc directorships.
    Coded by: Andrew McBurney
"""

from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    """
        Root index for app.
    """
    return 'Hello, World!'


@app.route('/directors')
def directors():
    """
        List of engsoc directors.
    """
    return 'Directors'


@app.route('/directors/<dirname>')
def director_info(dirname):
    """
        Listing for each engsoc director.
    """
    return 'Director %s' % dirname


if __name__ == "__main__":
    app.run()
