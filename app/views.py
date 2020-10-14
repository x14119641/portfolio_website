from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from app.auth import login_required
from app.db import get_db

bp = Blueprint('views', __name__, template_folder='templates')

@bp.route('/')
def index():
    return render_template('index.html')

@bp.route('/projects')
def projects():
    db = get_db()
    data = db.execute(
        'SELECT p.id, title, body, created, author_id, repo, tags, web'
        ' FROM projects p JOIN users u ON p.author_id = u.id'
        ' WHERE username = "admin"'
    ).fetchall()
    print(data)
    for d in data:
        print('# ', d)
    return render_template('projects/projects.html', data=data)