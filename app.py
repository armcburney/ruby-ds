#!/usr/bin/env python
#pylint: disable=C0103

"""
    EngSoc Directorships - webserver for engsoc directorship listings.
    Coded by: Andrew McBurney (VP Academic 'B'-Society)

    Inteded for use within EngSoc executive.
"""

import helpers
from os import path
from flask import Flask
from flask import render_template as render

app = Flask(__name__)
app.jinja_env.add_extension('pyjade.ext.jinja.PyJadeExtension')


@app.route('/')
def index():
    """
        Root index for app. Renders the main page of the EngSoc directorship
        site with the default title.
    """
    return render('index.jade', title='EngSoc Directorships')


@app.route('/directors')
def list_directors():
    """
        Renders the list of all EngSoc directors.

        'directors.jade', the template associated with this endpoint renders
        a list of EngSoc directors, with their information stored in private
        JSON files.
    """
    directorships = helpers.get_json(directory_path=
                                     path.join(app.static_folder,
                                               'private/directors'))

    return render('directors.jade', title='List of EngSoc Directors',
                  directorships=directorships)


@app.route('/directors/<dirname>')
def show_director(dirname):
    """
        Route for each engsoc director. Shows details such as name, email, and
        directorships(s) they're listed for.
    """
    return render('director_name.jade', title='EngSoc Director - ' + dirname,
                  name=dirname)


@app.route('/directorships')
def list_directorships():
    """
        Lists all directorships, and the directors that belong to them.

        'directorships.jade', the template associated with this endpoint,
        renders the list of directorships for the given term, with the
        information stored in private JSON files.
    """
    directorships = helpers.get_json(directory_path=
                                     path.join(app.static_folder,
                                               'private/directorships'))

    return render('directorships.jade', title='List of EngSoc Directorships',
                  directorships=directorships)


@app.route('/directorships/<directorship>')
def show_directorship(directorship):
    """
        Lists all directorships, and the directors that belong to them.
    """
    return render('directorship.jade', title='EngSoc Directorship - ' +
                  directorship, name=directorship)


if __name__ == '__main__':
    app.run()
