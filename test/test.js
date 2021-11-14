const request = require('supertest');

const { app } = require('../index');

describe('GET /', () => {
  it('responds with Hello word', (done) => {
    request(app).get('/').expect('Hello word!', done)
  })
});
