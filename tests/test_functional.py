import os
import tempfile

import pytest

from app import create_app


@pytest.fixture
def client():
    db_fd, db_path = tempfile.mkstemp()

    app = create_app()

    with app.test_client() as client:
        with app.app_context():
            #app.init_db()
            pass
        yield client

    os.close(db_fd)
    os.unlink(db_path)



def test_hello(client):
    assert b'Hello' in client.get('/hello').data
    
    