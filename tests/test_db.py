import sqlite3
import pytest
from app.db import get_db



@pytest.fixture
def db(app):
    with app.app_context():
        yield get_db()


def test_init_db_command(runner, monkeypatch):
    class Recorder(object):
        called = False
        
    def fake_init_db():
         Recorder.called = True
    
    monkeypatch.setattr('app.db.init_db', fake_init_db)
    result = runner.invoke(args=['init-db'])
    assert 'Initialized' in result.output
    assert Recorder.called


def test_data_in(db):
    users = db.execute('SELECT COUNT(id) as counter FROM users').fetchone()[0]
    assert users == 2
    
    test_user = db.execute('SELECT * FROM users WHERE username = "test"').fetchone()
    assert test_user['email'] == 'test@testing.com'

    projects = db.execute('SELECT * FROM projects WHERE author_id=2').fetchone()
    assert 'body' in projects['body']
    assert 'other' in projects['title']

    