#!/usr/bin/env python

"""
    Helpers.py - helper functions for app.py
"""

import json
from os import path, listdir

def get_json(directory_path):
    """
        Returns an array of json encoded object after walking a directory for
        files.
    """
    json_object = []

    # Open json files with data for and store them in array
    for name in listdir(directory_path):
        if name.endswith('.json'):
            with open(path.join(directory_path, name), 'r') as file_name:
                json_object.append(json.loads(file_name.read()))

    return json_object
