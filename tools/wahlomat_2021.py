#!/usr/bin/env python

import io
import json
import os
import subprocess
from urllib import request


# directory to save files
PROCESSING_DIR = 'online'
COMMENTS = 'comment.json'
OPINION = 'opinion.json'
PARTY = 'party.json'
STATEMENTS = 'statement.json'
WOM_DEF_GENERAL = 'app/definitionen/module_definition.js'
WOM_DEF_COMMENT = 'app/definitionen/module_definition_statements.js'

wom = [
    'https://www.wahl-o-mat.de/sachsenanhalt2021/'
]


def save_json(filename, jsonobject):
    with io.open(filename, 'w', encoding='utf-8') as json_file:
        json_file.write(
            '[\n  %s\n]\n' % ',\n  '.join(json.dumps(
                item, ensure_ascii=False, separators=(', ', ':'))
                    for item in jsonobject))


def download_file(url, filename, append_content='', overwrite=False):
    print('Download: {}'.format(url))
    response = request.urlopen(url)
    # get bytes
    data = response.read()
    # convert bytes to str
    text = data.decode('utf-8')

    if response.status != 200:
        raise Exception('Status Code: {}'.format(response.status))

    text += append_content

    if not os.path.isfile(filename) or overwrite:
        with io.open(filename, 'w', encoding='utf8') as f:
            f.write(text)


# go into processing dir
dirname = os.path.dirname(os.path.realpath(__file__))
os.chdir(os.path.join(dirname, PROCESSING_DIR))

for version in wom:
    # get last string from url
    fileprefix = version.strip('/').split('/')[-1]
    # create folder
    os.makedirs(fileprefix, exist_ok=True)

    final_url = version + WOM_DEF_COMMENT
    append = '\n\nmodule.exports = {comment: WOMT_aThesenParteienText};'
    final_path_comment = '{}_{}'.format(
        fileprefix, os.path.basename(WOM_DEF_COMMENT))
    download_file(final_url, final_path_comment, append_content=append)

    final_url = version + WOM_DEF_GENERAL
    append = ('\n\n'
              'module.exports = {\n'
              '    statement: WOMT_aThesen,\n'
              '    opinion: WOMT_aThesenParteien,\n'
              '    party: WOMT_aParteien\n'
              '};')
    final_path_general = '{}_{}'.format(
        fileprefix, os.path.basename(WOM_DEF_GENERAL))
    download_file(final_url, final_path_general, append_content=append)

    # call nodejs to give back comments.json
    cmd = ['nodejs', '../statement.js',
           './online/' + final_path_comment.split('.')[0]]
    p = subprocess.Popen(cmd)
    returncode = p.wait()
    if returncode != 0:
        raise Exception('{} returned: {}'.format(cmd, p.stderr))

    # read in comment.json and convert to our idea of beautiful stringify
    with io.open(COMMENTS, 'r', encoding='utf-8') as nodeexport:
        raw = nodeexport.read()
    comments = json.loads(raw)
    # add surrounding quotes
    for c in comments:
        c['text'] = '"{}"'.format(c['text'])
    save_json(os.path.join(fileprefix, COMMENTS), comments)

    # call nodejs to give back party.json / opinion.json / statements.json
    cmd = ['nodejs', '../general.js',
           './online/' + final_path_general.split('.')[0]]
    p = subprocess.Popen(cmd)
    returncode = p.wait()
    if returncode != 0:
        raise Exception('{} returned: {}'.format(cmd, p.stderr))

    # read in party.json and convert to our idea of beautiful stringify
    with io.open(PARTY, 'r', encoding='utf-8') as nodeexport:
        raw = nodeexport.read()
    parties = json.loads(raw)
    save_json(os.path.join(fileprefix, PARTY), parties)

    # read in statement.json and convert to our idea of beautiful stringify
    with io.open(STATEMENTS, 'r', encoding='utf-8') as nodeexport:
        raw = nodeexport.read()
    statements = json.loads(raw)
    save_json(os.path.join(fileprefix, STATEMENTS), statements)

    # read in comment.json and convert to our idea of beautiful stringify
    with io.open(OPINION, 'r', encoding='utf-8') as nodeexport:
        raw = nodeexport.read()
    opinions = json.loads(raw)
    save_json(os.path.join(fileprefix, OPINION), opinions)


# cleanup
os.remove(COMMENTS)
os.remove(PARTY)
os.remove(STATEMENTS)
os.remove(OPINION)
