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